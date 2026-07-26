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
        return [];
    }

    /**
     * Tab Filter Cepat Ancaman Keamanan (Quick Threat Tabs).
     */
    public function getTabs(): array
    {
        return [
            'all' => Tab::make('Semua Log')
                ->icon('heroicon-m-queue-list')
                ->badge(ActivityLog::count())
                ->badgeColor('gray'),

            'threats' => Tab::make('Hanya Ancaman / Serangan 🛡️')
                ->icon('heroicon-m-shield-exclamation')
                ->modifyQueryUsing(fn (Builder $query) => $query->whereIn('severity', ['CRITICAL', 'WARNING']))
                ->badge(ActivityLog::whereIn('severity', ['CRITICAL', 'WARNING'])->count())
                ->badgeColor('danger'),

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
