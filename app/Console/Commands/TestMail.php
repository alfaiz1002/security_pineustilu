<?php

namespace App\Console\Commands;

use App\Mail\BookingConfirmationMail;
use App\Mail\PaymentConfirmationMail;
use App\Models\Booking;
use App\Models\Payment;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;

class TestMail extends Command
{
    /**
     * The name and signature of the console command.
     */
    protected $signature = 'mail:test
                            {email : Alamat email tujuan}
                            {--type=booking : Jenis email yang dikirim (booking|payment)}';

    /**
     * The console command description.
     */
    protected $description = 'Kirim test email konfirmasi booking atau pembayaran ke alamat email tertentu';

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        $email = $this->argument('email');
        $type  = $this->option('type');

        $this->info("🔄 Mengirim email {$type} ke: {$email}");

        try {
            if ($type === 'booking') {
                $booking = Booking::with('user')->latest()->firstOrFail();
                Mail::to($email)->send(new BookingConfirmationMail($booking));
                \App\Services\AuditLogService::log(
                    'email_booking_sent',
                    "Email konfirmasi reservasi (Tes: {$booking->token_code}) dikirim ke {$email}",
                    $booking->user_id,
                    'INFO'
                );
                $this->info("✅ Email konfirmasi reservasi berhasil dikirim!");
                $this->line("   Token: {$booking->token_code}");
            } elseif ($type === 'payment') {
                $payment = Payment::with('booking.user')->latest()->firstOrFail();
                Mail::to($email)->send(new PaymentConfirmationMail($payment));
                \App\Services\AuditLogService::log(
                    'email_payment_sent',
                    "Email konfirmasi pembayaran lunas (Tes: {$payment->order_id}) dikirim ke {$email}",
                    $payment->booking?->user_id,
                    'INFO'
                );
                $this->info("✅ Email konfirmasi pembayaran berhasil dikirim!");
                $this->line("   Order ID: {$payment->order_id}");
            } else {
                $this->error("❌ Tipe tidak valid. Gunakan --type=booking atau --type=payment");
                return self::FAILURE;
            }
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            $this->error("❌ Data {$type} tidak ditemukan di database. Pastikan ada data booking/payment.");
            return self::FAILURE;
        } catch (\Exception $e) {
            $this->error("❌ Gagal mengirim email: " . $e->getMessage());
            $this->line("   Pastikan konfigurasi SMTP di .env sudah benar.");
            return self::FAILURE;
        }

        return self::SUCCESS;
    }
}
