<?php

namespace App\Support;

class Ocra
{
    /**
     * Generate kode OCRA sesuai RFC 6287.
     * Contoh suite yang dipakai di tutorial ini: "OCRA-1:HOTP-SHA1-6:QN08"
     * (challenge numerik 8 digit, HMAC-SHA1, output 6 digit)
     */
    public static function generate(
        string $ocraSuite,
        string $keyHex,
        string $question,
        ?int $counter = null,
        string $pinHashHex = '',
        string $sessionHex = '',
        ?int $timestamp = null
    ): string {
        $key = hex2bin($keyHex);

        $suiteParts = explode(':', $ocraSuite);
        $cryptoFunction = $suiteParts[1];   // contoh: HOTP-SHA1-6
        $dataInputDesc  = $suiteParts[2];   // contoh: QN08

        [, $hashAlgo, $digitsStr] = explode('-', $cryptoFunction);
        $hashAlgo = strtolower($hashAlgo);
        $digits   = (int) $digitsStr;

        $message = $ocraSuite . "\0";

        foreach (explode('-', $dataInputDesc) as $component) {
            $type = $component[0];

            $message .= match ($type) {
                'C' => self::packCounter($counter ?? 0),
                'Q' => self::packQuestion($question),
                'P' => $pinHashHex === '' ? '' : hex2bin($pinHashHex),
                'S' => self::packSession($sessionHex, $component),
                'T' => self::packTimestamp($timestamp ?? time(), $component),
                default => '',
            };
        }

        $hash   = hash_hmac($hashAlgo, $message, $key, true);
        $offset = ord(substr($hash, -1)) & 0x0f;

        $binary = ((ord($hash[$offset]) & 0x7f) << 24)
            | ((ord($hash[$offset + 1]) & 0xff) << 16)
            | ((ord($hash[$offset + 2]) & 0xff) << 8)
            | (ord($hash[$offset + 3]) & 0xff);

        return str_pad((string) ($binary % (10 ** $digits)), $digits, '0', STR_PAD_LEFT);
    }

    private static function packCounter(int $counter): string
    {
        return hex2bin(str_pad(dechex($counter), 16, '0', STR_PAD_LEFT));
    }

    private static function packQuestion(string $question): string
    {
        // Challenge numerik: nilai desimal diubah ke heksadesimal,
        // lalu di-pad kanan dengan '0' sampai 128 byte (256 karakter hex)
        $hex = strtoupper(dechex((int) $question));
        $hex = str_pad($hex, 256, '0', STR_PAD_RIGHT);

        return hex2bin($hex);
    }

    private static function packSession(string $sessionHex, string $component): string
    {
        $length = (int) substr($component, 1);
        $length = $length > 0 ? $length : 64;

        return hex2bin(str_pad($sessionHex, $length * 2, '0', STR_PAD_RIGHT));
    }

    private static function packTimestamp(int $timestamp, string $component): string
    {
        $step = 60; // default T1M (1 menit)

        if (preg_match('/T(\d+)([SMH])/', $component, $m)) {
            $step = match ($m[2]) {
                'S' => (int) $m[1],
                'M' => (int) $m[1] * 60,
                'H' => (int) $m[1] * 3600,
            };
        }

        return hex2bin(str_pad(dechex(intdiv($timestamp, $step)), 16, '0', STR_PAD_LEFT));
    }
}