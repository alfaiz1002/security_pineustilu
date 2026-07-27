<?php

namespace App\Console\Commands;

use App\Support\Ocra;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Hash;
use OTPHP\HOTP;
use OTPHP\TOTP;

class BenchmarkOtp extends Command
{
    protected $signature = 'benchmark:otp {iterations=50}';
    protected $description = 'Benchmark Stateful Random OTP vs HOTP vs TOTP vs OCRA';

    public function handle(): void
    {
        $n = (int) $this->argument('iterations');
        $secretHex = bin2hex(random_bytes(20)); // kunci 160-bit, standar OATH

        $results = [
            'Stateful Random (Baseline)' => $this->benchmarkStateful($n),
            'HOTP (RFC 4226)'            => $this->benchmarkHotp($secretHex, $n),
            'TOTP (RFC 6238)'            => $this->benchmarkTotp($secretHex, $n),
            'OCRA (RFC 6287)'            => $this->benchmarkOcra($secretHex, $n),
        ];

        $this->info("Environment: PHP " . PHP_VERSION . " | OS: " . PHP_OS . " | Iterasi: {$n}");
        $this->newLine();

        $this->table(
            ['Algoritma', 'Generate Mean (ms)', 'Verify Mean (ms)'],
            collect($results)->map(fn ($r, $name) => [
                $name,
                number_format($r['generate'], 4),
                number_format($r['verify'], 4),
            ])->values()->toArray()
        );
    }

    private function benchmarkStateful(int $n): array
    {
        $generateTimes = [];
        $verifyTimes   = [];

        for ($i = 0; $i < $n; $i++) {
            $t0 = microtime(true);
            $otp  = (string) random_int(100000, 999999);
            $hash = Hash::make($otp); // bcrypt, cost sesuai config/hashing.php
            $generateTimes[] = (microtime(true) - $t0) * 1000;

            $t0 = microtime(true);
            Hash::check($otp, $hash);
            $verifyTimes[] = (microtime(true) - $t0) * 1000;
        }

        return [
            'generate' => array_sum($generateTimes) / $n,
            'verify'   => array_sum($verifyTimes) / $n,
        ];
    }

    private function benchmarkHotp(string $secretHex, int $n): array
    {
        $hotp = HOTP::create($secretHex);
        $generateTimes = [];
        $verifyTimes   = [];

        for ($counter = 0; $counter < $n; $counter++) {
            $t0  = microtime(true);
            $otp = $hotp->at($counter);
            $generateTimes[] = (microtime(true) - $t0) * 1000;

            $t0 = microtime(true);
            $hotp->verify($otp, $counter);
            $verifyTimes[] = (microtime(true) - $t0) * 1000;
        }

        return [
            'generate' => array_sum($generateTimes) / $n,
            'verify'   => array_sum($verifyTimes) / $n,
        ];
    }

    private function benchmarkTotp(string $secretHex, int $n): array
    {
        $totp = TOTP::create($secretHex);
        $generateTimes = [];
        $verifyTimes   = [];

        for ($i = 0; $i < $n; $i++) {
            $timestamp = time() + ($i * 30); // geser tiap periode, supaya tiap iterasi unik

            $t0  = microtime(true);
            $otp = $totp->at($timestamp);
            $generateTimes[] = (microtime(true) - $t0) * 1000;

            $t0 = microtime(true);
            $totp->verify($otp, $timestamp);
            $verifyTimes[] = (microtime(true) - $t0) * 1000;
        }

        return [
            'generate' => array_sum($generateTimes) / $n,
            'verify'   => array_sum($verifyTimes) / $n,
        ];
    }

    private function benchmarkOcra(string $secretHex, int $n): array
    {
        $generateTimes = [];
        $verifyTimes   = [];
        $suite = 'OCRA-1:HOTP-SHA1-6:QN08';

        for ($i = 0; $i < $n; $i++) {
            $challenge = str_pad((string) random_int(0, 99999999), 8, '0', STR_PAD_LEFT);

            $t0  = microtime(true);
            $otp = Ocra::generate($suite, $secretHex, $challenge);
            $generateTimes[] = (microtime(true) - $t0) * 1000;

            // Verifikasi OCRA = generate ulang dari challenge yang sama, lalu dibandingkan
            $t0 = microtime(true);
            Ocra::generate($suite, $secretHex, $challenge) === $otp;
            $verifyTimes[] = (microtime(true) - $t0) * 1000;
        }

        return [
            'generate' => array_sum($generateTimes) / $n,
            'verify'   => array_sum($verifyTimes) / $n,
        ];
    }
}