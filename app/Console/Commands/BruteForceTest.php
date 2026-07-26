<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;

class BruteForceTest extends Command
{
    protected $signature = 'security:bruteforce {email}';
    protected $description = 'Test brute force protection';

    public function handle()
    {
        $email = $this->argument('email');
        $url = 'http://127.0.0.1:8000/login';

        $passwords = ['123456', 'password', 'admin123', 'qwerty', 'admin'];

        $this->info("Testing brute force for: $email");
        $this->line("================================");

        foreach ($passwords as $pwd) {
            $response = Http::post($url, [
                'email' => $email,
                'password' => $pwd
            ]);

            if ($response->status() == 429) {
                $this->error("Rate limit terdeteksi!");
                break;
            }

            if (str_contains($response->body(), 'dashboard')) {
                $this->info("[✓] Password ditemukan: $pwd");
                break;
            } else {
                $this->line("Mencoba: $pwd - Gagal");
            }
        }
    }
}