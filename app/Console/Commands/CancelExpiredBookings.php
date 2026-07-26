<?php

namespace App\Console\Commands;

use App\Models\Booking;
use App\Enums\BookingStatus;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class CancelExpiredBookings extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'booking:cancel-expired';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Batalkan booking yang statusnya proses/pembayaran dan sudah lewat dari 1 jam sejak dibuat.';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $expiredBookings = Booking::whereIn('status', ['proses', 'pembayaran'])
            ->where('created_at', '<=', now()->subHour())
            ->get();

        $count = 0;
        foreach ($expiredBookings as $booking) {
            $booking->update(['status' => BookingStatus::DIBATALKAN]);
            \App\Services\AuditLogService::log(
                'booking_expired_cleanup',
                "Booking {$booking->token_code} dibatalkan otomatis oleh command sistem karena melewati batas pembayaran 1 jam.",
                $booking->user_id,
                'INFO'
            );
            $count++;
        }

        if ($count > 0) {
            $this->info("Berhasil membatalkan {$count} pesanan yang kedaluwarsa (lewat dari 1 jam).");
            Log::info("Command booking:cancel-expired membatalkan {$count} pesanan.");
        } else {
            $this->info('Tidak ada pesanan kedaluwarsa yang perlu dibatalkan.');
        }
    }
}
