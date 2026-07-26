<?php

namespace App\Filament\Resources\ActivityLogResource\Pages;

use App\Filament\Resources\ActivityLogResource;
use Filament\Resources\Pages\ListRecords;

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
}
