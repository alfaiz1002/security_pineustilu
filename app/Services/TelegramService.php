<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class TelegramService
{
    /**
     * Send an instant security alert message to the Telegram Group.
     *
     * @param string $message
     * @return bool
     */
    public static function sendAlert(string $message): bool
    {
        $botToken = env('TELEGRAM_BOT_TOKEN');
        $chatId = env('TELEGRAM_SECURITY_CHAT_ID');

        if (!$botToken || !$chatId) {
            Log::warning('Telegram bot token or chat ID is missing in .env file.');
            return false;
        }

        try {
            $response = Http::post("https://api.telegram.org/bot{$botToken}/sendMessage", [
                'chat_id' => $chatId,
                'text' => $message,
                'parse_mode' => 'Markdown',
            ]);

            if ($response->successful() && ($response->json('ok') === true)) {
                Log::info('Telegram security alert sent successfully.');
                return true;
            }

            Log::error('Telegram API response error', ['response' => $response->json()]);
            return false;
        } catch (\Exception $e) {
            Log::error('Telegram API Exception: ' . $e->getMessage());
            return false;
        }
    }
}
