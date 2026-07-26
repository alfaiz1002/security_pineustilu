<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;

class DetectSsrfService
{
    /**
     * Memeriksa apakah URL yang diakses mengarah ke IP privat atau loopback (potensi SSRF).
     *
     * @param string $url
     * @return bool True jika terdeteksi SSRF, False jika aman
     */
    public function checkUrl(string $url): bool
    {
        $host = parse_url($url, PHP_URL_HOST);

        if (!$host) {
            return false;
        }

        // Resolusi host ke IP address
        $ip = gethostbyname($host);

        if (!$ip || $ip === $host) {
            // Jika tidak dapat diresolusi, cek apakah host adalah IP mentah
            $ip = $host;
        }

        if ($this->isPrivateIp($ip)) {
            AuditLogService::logSsrfAttempt($url);
            return true;
        }

        return false;
    }

    /**
     * Mengecek apakah IP merupakan IP private atau loopback.
     */
    private function isPrivateIp(string $ip): bool
    {
        // Validasi IPv4
        if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4)) {
            $ipLong = ip2long($ip);
            if ($ipLong === false) {
                return false;
            }

            // 127.0.0.0/8 (Loopback)
            if (($ipLong & 0xFF000000) === 0x7F000000) {
                return true;
            }

            // 10.0.0.0/8 (Private A)
            if (($ipLong & 0xFF000000) === 0x0A000000) {
                return true;
            }

            // 172.16.0.0/12 (Private B)
            if (($ipLong & 0xFFF00000) === 0xAC100000) {
                return true;
            }

            // 192.168.0.0/16 (Private C)
            if (($ipLong & 0xFFFF0000) === 0xC0A80000) {
                return true;
            }

            // 169.254.0.0/16 (Link Local)
            if (($ipLong & 0xFFFF0000) === 0xA9FE0000) {
                return true;
            }

            // 0.0.0.0/8 (Broadcast/Local)
            if (($ipLong & 0xFF000000) === 0x00000000) {
                return true;
            }
        }

        // Validasi IPv6
        if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6)) {
            // Loopback ::1
            if ($ip === '::1' || $ip === '0000:0000:0000:0000:0000:0000:0000:0001') {
                return true;
            }

            // Unique Local Address (fc00::/7)
            $hex = bin2hex(inet_pton($ip));
            if ($hex === false) {
                return false;
            }
            $firstByte = hexdec(substr($hex, 0, 2));
            if (($firstByte & 0xFE) === 0xFC) {
                return true;
            }

            // Link-Local (fe80::/10)
            if (($firstByte & 0xC0) === 0x80) {
                return true;
            }
        }

        return false;
    }
}
