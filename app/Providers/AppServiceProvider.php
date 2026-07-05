<?php

namespace App\Providers;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Http\Request;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Prevent lazy loading in non-production environments
        // This helps catch N+1 query problems during development
        Model::preventLazyLoading(!App::isProduction());

        // Prevent silently discarding attributes that are not in $fillable
        Model::preventSilentlyDiscardingAttributes(!App::isProduction());

        // Force HTTPS in production
        if (App::isProduction()) {
            URL::forceScheme('https');
        }

        // OTP Rate Limiters — separated per action to avoid shared counter exhaustion
        // Bug #2 fix: each route gets its own independent counter
        // Bug #3 fix: returns JSON response instead of HTML for frontend compatibility

        // Registration: max 5 attempts per 15 minutes
        RateLimiter::for('otp-register', function (Request $request) {
            return Limit::perMinutes(15, 5)
                ->by('register|' . ($request->phone ?: $request->email ?: $request->ip()))
                ->response(function (Request $request, array $headers) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Terlalu banyak percobaan registrasi. Silakan coba lagi dalam 15 menit.',
                    ], 429, $headers);
                });
        });

        // OTP Verification: max 10 attempts per 15 minutes (higher since user may need multiple tries)
        RateLimiter::for('otp-verify', function (Request $request) {
            return Limit::perMinutes(15, 10)
                ->by('verify|' . ($request->phone ?: $request->ip()))
                ->response(function (Request $request, array $headers) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Terlalu banyak percobaan verifikasi. Silakan coba lagi dalam 15 menit.',
                    ], 429, $headers);
                });
        });

        // OTP Resend: max 5 resends per 15 minutes
        RateLimiter::for('otp-resend', function (Request $request) {
            return Limit::perMinutes(15, 5)
                ->by('resend|' . ($request->phone ?: $request->email ?: $request->ip()))
                ->response(function (Request $request, array $headers) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Terlalu banyak permintaan kirim ulang OTP. Silakan coba lagi dalam 15 menit.',
                    ], 429, $headers);
                });
        });
    }
}
