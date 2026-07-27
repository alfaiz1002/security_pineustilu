<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
<<<<<<< HEAD
        // Percayai semua proxy (Render menggunakan reverse proxy)
        $middleware->trustProxies(at: '*');

        // Bypass CSRF untuk route verify-otp dan Midtrans notification
=======
        // Bypass CSRF untuk route verify-otp, Midtrans notification, dan CSP report
>>>>>>> ea27537aaa45784afb5175e959a9e63569342f8d
        $middleware->validateCsrfTokens(except: [
            'api/payment/notification',
            'api/csp-report',
            'verify-otp',
        ]);

        // Daftarkan middleware BlockHiddenFiles secara global
        $middleware->append(\App\Http\Middleware\BlockHiddenFiles::class);

        // Daftarkan middleware LogInvalidSession untuk mendeteksi CSRF/session invalid
        $middleware->append(\App\Http\Middleware\LogInvalidSession::class);

        // Daftarkan middleware DetectInjectionMiddleware secara global
        $middleware->append(\App\Http\Middleware\DetectInjectionMiddleware::class);

        // Daftarkan middleware DetectDebugEndpointMiddleware secara global
        $middleware->append(\App\Http\Middleware\DetectDebugEndpointMiddleware::class);

        // Daftarkan middleware SecurityHeadersMiddleware secara global
        $middleware->append(\App\Http\Middleware\SecurityHeadersMiddleware::class);

        // Daftarkan middleware DetectBotScrapingMiddleware secara global untuk deteksi scraper/bot
        $middleware->append(\App\Http\Middleware\DetectBotScrapingMiddleware::class);

        $middleware->alias([
            'role' => \Spatie\Permission\Middleware\RoleMiddleware::class,
            'permission' => \Spatie\Permission\Middleware\PermissionMiddleware::class,
            'role_or_permission' => \Spatie\Permission\Middleware\RoleOrPermissionMiddleware::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })
    ->withProviders([
        // Service Provider untuk audit event listeners (2FA failed, dll)
        \App\Providers\AuditEventServiceProvider::class,
    ])
    ->create();
