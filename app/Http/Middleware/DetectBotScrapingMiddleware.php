<?php

namespace App\Http\Middleware;

use App\Services\AuditLogService;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Symfony\Component\HttpFoundation\Response;

class DetectBotScrapingMiddleware
{
    /**
     * Known automated scraping / bot User-Agent signatures.
     */
    protected array $botSignatures = [
        'python-requests',
        'python-urllib',
        'scrapy',
        'curl/',
        'wget/',
        'go-http-client',
        'httpclient',
        'headlesschrome',
        'phantomjs',
        'puppeteer',
        'selenium',
        'beautifulsoup',
        'httpx',
    ];

    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next): Response
    {
        $userAgent = strtolower($request->header('User-Agent', ''));
        $ip = $request->ip();

        // 1. Signature-based Bot Detection
        foreach ($this->botSignatures as $signature) {
            if (str_contains($userAgent, $signature)) {
                $cacheKey = "bot_log_" . md5($ip . '_' . $signature);
                if (!Cache::has($cacheKey)) {
                    Cache::put($cacheKey, true, now()->addMinutes(5));
                    AuditLogService::logBotScrapingAttempt(
                        $request->fullUrl(),
                        $request->header('User-Agent', 'Unknown Bot')
                    );
                }
                break;
            }
        }

        // 2. High-Frequency Rate Anomaly Detection (Rate-Based Scraping)
        $rateKey = "rate_scraping_" . md5($ip);
        $requestCount = Cache::increment($rateKey);
        if ($requestCount === 1) {
            Cache::put($rateKey, 1, now()->addMinute());
        }

        if ($requestCount > 50) {
            $logKey = "bot_rate_log_" . md5($ip);
            if (!Cache::has($logKey)) {
                Cache::put($logKey, true, now()->addMinutes(5));
                AuditLogService::logBotScrapingAttempt(
                    $request->fullUrl() . " (Frekuensi Tinggi: {$requestCount} req/min)",
                    $request->header('User-Agent', 'Unknown')
                );
            }
        }

        return $next($request);
    }
}
