<?php

namespace App\Filament\Resources\ActivityLogResource\Pages;

use App\Filament\Resources\ActivityLogResource;
use App\Models\ActivityLog;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;

class ListActivityLogs extends ListRecords
{
    protected static string $resource = ActivityLogResource::class;

    /**
     * Tidak ada tombol "Create" karena resource ini read-only.
     */
    protected function getHeaderActions(): array
    {
        return [
            \Filament\Actions\Action::make('prune_logs')
                ->label('🧹 Bersihkan Log Lama (>90 Hari)')
                ->icon('heroicon-m-trash')
                ->color('warning')
                ->requiresConfirmation()
                ->modalHeading('Pembersihan Log Aktivitas (Log Retention Policy)')
                ->modalDescription('Apakah Anda yakin ingin membersihkan log aktivitas keamanan yang berusia lebih dari 90 hari? Tindakan ini aman dan bertujuan menghemat penyimpanan basis data MySQL.')
                ->action(function () {
                    $cutoffDate = now()->subDays(90);
                    $count = \App\Models\ActivityLog::where('created_at', '<', $cutoffDate)->delete();

                    if ($count > 0) {
                        \App\Services\AuditLogService::log(
                            'manual_log_pruned',
                            "Super Admin melakukan pembersihan manual {$count} log aktivitas lama (> 90 hari).",
                            auth()->id(),
                            'INFO'
                        );
                    }

                    \Filament\Notifications\Notification::make()
                        ->title('Pembersihan Berhasil')
                        ->body("Berhasil membersihkan {$count} log aktivitas lama yang berusia lebih dari 90 hari.")
                        ->success()
                        ->send();
                }),
        ];
    }

    /**
     * Tab Filter Bersih Berdasarkan Severity (Tanpa Overlap).
     */
    public function getTabs(): array
    {
        return [
            'all' => Tab::make('Semua Log')
                ->icon('heroicon-m-queue-list')
                ->badge(ActivityLog::count())
                ->badgeColor('gray'),

            'critical' => Tab::make('Serangan Kritis 🔴')
                ->icon('heroicon-m-exclamation-triangle')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('severity', 'CRITICAL'))
                ->badge(ActivityLog::where('severity', 'CRITICAL')->count())
                ->badgeColor('danger'),

            'warning' => Tab::make('Peringatan 🟡')
                ->icon('heroicon-m-bell-alert')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('severity', 'WARNING'))
                ->badge(ActivityLog::where('severity', 'WARNING')->count())
                ->badgeColor('warning'),

            'info' => Tab::make('Aktivitas Sah 🟢')
                ->icon('heroicon-m-check-circle')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('severity', 'INFO'))
                ->badge(ActivityLog::where('severity', 'INFO')->count())
                ->badgeColor('success'),
        ];
    }
}
