<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\ActivityLog;
use App\Services\AuditLogService;

class PruneAuditLogs extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'audit-log:prune {--days=90 : Batas usia hari log yang akan dihapus}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Otomatis menghapus log aktivitas lama melebihi batas hari yang ditentukan (Kebijakan Log Retention SOP ISO 27001)';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $days = (int) $this->option('days');
        if ($days <= 0) {
            $days = 90;
        }

        $cutoffDate = now()->subDays($days);
        $deletedCount = ActivityLog::where('created_at', '<', $cutoffDate)->delete();

        $message = "Berhasil membersihkan {$deletedCount} log aktivitas keamanan yang berusia lebih dari {$days} hari (sebelum {$cutoffDate->format('Y-m-d H:i:s')}).";
        $this->info($message);

        if ($deletedCount > 0) {
            AuditLogService::log(
                'audit_log_pruned',
                $message,
                null,
                'INFO'
            );
        }

        return Command::SUCCESS;
    }
}
