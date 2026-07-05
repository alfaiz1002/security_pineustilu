<?php

namespace App\Services;

use App\Models\ActivityLog;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Carbon;

class AuditLogService
{
    /**
     * Catat aktivitas ke tabel activity_logs.
     *
     * @param  string   $event        Nama event (misal: 'login', 'login_failed', 'otp_verified')
     * @param  string   $description  Deskripsi detail kejadian
     * @param  int|null $userId       ID user (opsional; jika null, akan fallback ke user yang sedang login)
     * @return void
     */
    public static function log(string $event, string $description, ?int $userId = null, string $severity = 'INFO'): void
    {
        try {
            // Jika userId tidak diberikan, coba ambil dari sesi auth yang aktif
            $resolvedUserId = $userId ?? Auth::id();

            // Ambil IP address dari request saat ini; fallback ke '0.0.0.0' jika tidak tersedia
            $ipAddress = request()?->ip() ?? '0.0.0.0';

            ActivityLog::create([
                'user_id'    => $resolvedUserId,
                'event'      => $event,
                'description' => $description,
                'ip_address'  => $ipAddress,
                'severity'   => $severity,
            ]);
        } catch (\Throwable $e) {
            // Jangan biarkan kegagalan logging menghentikan jalannya aplikasi
            Log::error('AuditLogService failed to write activity log', [
                'event'       => $event,
                'description' => $description,
                'error'       => $e->getMessage(),
            ]);
        }
    }

    /**
     * Cek apakah ada percobaan brute force dari IP tertentu.
     * Jika terdapat >= 5 login gagal dalam 2 menit dari IP yang sama,
     * dan belum ada log brute_force untuk IP tersebut dalam window yang sama,
     * maka catat event 'brute_force'.
     *
     * @param  string $ip  IP address yang sedang dicek
     * @return void
     */
    public static function checkBruteForce(string $ip): void
    {
        try {
            $window = Carbon::now()->subMinutes(2);

            $failedCount = ActivityLog::where('event', 'login_failed')
                ->where('ip_address', $ip)
                ->where('created_at', '>=', $window)
                ->count();

            if ($failedCount >= 5) {
                // Cegah duplikasi: cek apakah sudah ada log brute_force dari IP ini dalam 2 menit terakhir
                $alreadyLogged = ActivityLog::where('event', 'brute_force')
                    ->where('ip_address', $ip)
                    ->where('created_at', '>=', $window)
                    ->exists();

                if (! $alreadyLogged) {
                    self::log(
                        'brute_force',
                        "{$failedCount}x login gagal dalam 2 menit dari IP: {$ip}",
                        null
                    );
                }
            }
        } catch (\Throwable $e) {
            Log::error('AuditLogService::checkBruteForce failed', [
                'ip'    => $ip,
                'error' => $e->getMessage(),
            ]);
        }
    }

    // A01 - Broken Access Control
    public static function logUnauthorizedAccess(string $url, ?int $userId = null): void
    {
        self::log('unauthorized_access', "Percobaan akses tidak sah ke URL: {$url}", $userId, 'CRITICAL');
    }

    public static function logIdorAttempt(string $resourceId, ?int $userId = null): void
    {
        self::log('idor_attempt', "Percobaan akses tidak sah ke resource ID: {$resourceId} (potensi IDOR)", $userId, 'CRITICAL');
    }

    public static function logPrivilegeEscalation(string $url, ?int $userId = null): void
    {
        self::log('privilege_escalation', "Percobaan eskalasi hak akses ke URL: {$url}", $userId, 'CRITICAL');
    }

    // A03 - Injection
    public static function logSqlInjectionAttempt(string $url): void
    {
        self::log('sql_injection_attempt', "Terdeteksi percobaan SQL Injection pada URL: {$url}", null, 'CRITICAL');
    }

    public static function logXssAttempt(string $field): void
    {
        self::log('xss_attempt', "Terdeteksi percobaan XSS pada parameter/field: {$field}", null, 'CRITICAL');
    }

    // A05 - Security Misconfiguration
    public static function logConfigChanged(string $key, string $adminEmail): void
    {
        self::log('config_changed', "Konfigurasi '{$key}' diubah oleh admin: {$adminEmail}", null, 'WARNING');
    }

    public static function logDebugAccess(string $url): void
    {
        self::log('debug_access', "Akses terdeteksi ke halaman/tool debug: {$url}", null, 'WARNING');
    }

    // A07 - Authentication (tambahan)
    public static function logSessionExpired(string $email): void
    {
        self::log('session_expired', "Sesi pengguna telah kedaluwarsa untuk email: {$email}", null, 'WARNING');
    }

    public static function logConcurrentSession(string $email, string $newIp, string $oldIp): void
    {
        self::log('concurrent_session', "Sesi konkuren terdeteksi untuk user {$email}. IP Baru: {$newIp}, IP Lama: {$oldIp}", null, 'WARNING');
    }

    public static function logAccountLocked(string $email, string $reason): void
    {
        self::log('account_locked', "Akun dikunci untuk email: {$email}. Alasan: {$reason}", null, 'CRITICAL');
    }

    public static function logAccountUnlocked(string $email, string $adminEmail): void
    {
        self::log('account_unlocked', "Akun dibuka kunci untuk email: {$email} oleh admin: {$adminEmail}", null, 'WARNING');
    }

    // A09 - Logging & Monitoring
    public static function logRateLimitExceeded(string $url): void
    {
        self::log('rate_limit_exceeded', "Batas percobaan terlampaui (rate limit exceeded) pada URL: {$url}", null, 'WARNING');
    }

    public static function logLogExported(string $adminEmail): void
    {
        self::log('log_exported', "Log aktivitas berhasil diexport oleh admin: {$adminEmail}", null, 'INFO');
    }

    // A10 - SSRF
    public static function logSsrfAttempt(string $targetUrl): void
    {
        self::log('ssrf_attempt', "Terdeteksi percobaan SSRF ke target URL: {$targetUrl}", null, 'CRITICAL');
    }

    /**
     * Catat ketika webhook notifikasi pembayaran diterima dari Midtrans.
     *
     * @param  string $orderId
     * @param  string $status
     * @return void
     */
    public static function logPaymentWebhookReceived(string $orderId, string $status): void
    {
        try {
            self::log('payment_webhook_received', "Webhook Midtrans diterima untuk order {$orderId} dengan status {$status}", null, 'INFO');
        } catch (\Throwable $e) {
            Log::error('AuditLogService::logPaymentWebhookReceived failed', [
                'order_id' => $orderId,
                'status' => $status,
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Catat ketika pembayaran berhasil.
     *
     * @param  string   $orderId
     * @param  float    $amount
     * @param  int|null $userId
     * @return void
     */
    public static function logPaymentSuccess(string $orderId, float $amount, ?int $userId): void
    {
        try {
            self::log('payment_success', "Pembayaran berhasil untuk order {$orderId} sebesar Rp {$amount}", $userId, 'INFO');
        } catch (\Throwable $e) {
            Log::error('AuditLogService::logPaymentSuccess failed', [
                'order_id' => $orderId,
                'amount' => $amount,
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Catat ketika pembayaran gagal atau kedaluwarsa.
     *
     * @param  string   $orderId
     * @param  string   $status
     * @param  int|null $userId
     * @return void
     */
    public static function logPaymentFailed(string $orderId, string $status, ?int $userId): void
    {
        try {
            self::log('payment_failed', "Pembayaran gagal/expired untuk order {$orderId} dengan status {$status}", $userId, 'WARNING');
        } catch (\Throwable $e) {
            Log::error('AuditLogService::logPaymentFailed failed', [
                'order_id' => $orderId,
                'status' => $status,
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Catat ketika pengguna mengajukan reschedule booking.
     *
     * @param  string   $tokenCode
     * @param  int|null $userId
     * @return void
     */
    public static function logRescheduleRequested(string $tokenCode, ?int $userId): void
    {
        try {
            self::log('reschedule_requested', "User mengajukan reschedule untuk booking {$tokenCode}", $userId, 'INFO');
        } catch (\Throwable $e) {
            Log::error('AuditLogService::logRescheduleRequested failed', [
                'token_code' => $tokenCode,
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Catat ketika reschedule disetujui oleh admin.
     *
     * @param  string      $tokenCode
     * @param  string|null $adminEmail
     * @return void
     */
    public static function logRescheduleApproved(string $tokenCode, ?string $adminEmail): void
    {
        try {
            self::log('reschedule_approved', "Reschedule booking {$tokenCode} disetujui oleh {$adminEmail}", null, 'INFO');
        } catch (\Throwable $e) {
            Log::error('AuditLogService::logRescheduleApproved failed', [
                'token_code' => $tokenCode,
                'admin_email' => $adminEmail,
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Catat ketika reschedule ditolak oleh admin.
     *
     * @param  string      $tokenCode
     * @param  string      $reason
     * @param  string|null $adminEmail
     * @return void
     */
    public static function logRescheduleRejected(string $tokenCode, string $reason, ?string $adminEmail): void
    {
        try {
            self::log('reschedule_rejected', "Reschedule booking {$tokenCode} ditolak oleh {$adminEmail} karena {$reason}", null, 'WARNING');
        } catch (\Throwable $e) {
            Log::error('AuditLogService::logRescheduleRejected failed', [
                'token_code' => $tokenCode,
                'reason' => $reason,
                'admin_email' => $adminEmail,
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Catat ketika pengguna mengajukan pembatalan booking.
     *
     * @param  string   $tokenCode
     * @param  float    $refundAmount
     * @param  int|null $userId
     * @return void
     */
    public static function logCancellationRequested(string $tokenCode, float $refundAmount, ?int $userId): void
    {
        try {
            self::log('cancellation_requested', "User mengajukan pembatalan booking {$tokenCode} dengan refund Rp {$refundAmount}", $userId, 'INFO');
        } catch (\Throwable $e) {
            Log::error('AuditLogService::logCancellationRequested failed', [
                'token_code' => $tokenCode,
                'refund_amount' => $refundAmount,
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Catat ketika pembatalan booking disetujui oleh admin.
     *
     * @param  string      $tokenCode
     * @param  string|null $adminEmail
     * @return void
     */
    public static function logCancellationApproved(string $tokenCode, ?string $adminEmail): void
    {
        try {
            self::log('cancellation_approved', "Pembatalan booking {$tokenCode} disetujui oleh {$adminEmail}", null, 'INFO');
        } catch (\Throwable $e) {
            Log::error('AuditLogService::logCancellationApproved failed', [
                'token_code' => $tokenCode,
                'admin_email' => $adminEmail,
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Catat ketika pembatalan booking ditolak oleh admin.
     *
     * @param  string      $tokenCode
     * @param  string      $reason
     * @param  string|null $adminEmail
     * @return void
     */
    public static function logCancellationRejected(string $tokenCode, string $reason, ?string $adminEmail): void
    {
        try {
            self::log('cancellation_rejected', "Pembatalan booking {$tokenCode} ditolak oleh {$adminEmail} karena {$reason}", null, 'WARNING');
        } catch (\Throwable $e) {
            Log::error('AuditLogService::logCancellationRejected failed', [
                'token_code' => $tokenCode,
                'reason' => $reason,
                'admin_email' => $adminEmail,
                'error' => $e->getMessage(),
            ]);
        }
    }
}
