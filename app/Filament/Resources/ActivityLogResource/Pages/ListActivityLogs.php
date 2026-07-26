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
            \Filament\Actions\Action::make('export_pdf')
                ->label('Cetak Laporan Forensik (PDF)')
                ->icon('heroicon-m-document-arrow-down')
                ->color('danger')
                ->url(fn (): string => route('admin.audit-log.export-pdf'))
                ->openUrlInNewTab(),
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
