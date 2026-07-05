<?php

namespace App\Providers;

use App\Listeners\LogTwoFactorFailedListener;
use Illuminate\Auth\Events\Failed;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

/**
 * Service Provider khusus untuk mendaftarkan listener event audit logging.
 * Diregistrasikan di bootstrap/app.php sebagai provider tambahan.
 */
class AuditEventServiceProvider extends ServiceProvider
{
    /**
     * Event listener mappings untuk audit logging.
     *
     * @var array<class-string, array<int, class-string>>
     */
    protected $listen = [
        // Tangkap event autentikasi gagal untuk mendeteksi kegagalan 2FA
        Failed::class => [
            LogTwoFactorFailedListener::class,
        ],
    ];

    /**
     * Register any events for your application.
     */
    public function boot(): void
    {
        parent::boot();
    }
}
