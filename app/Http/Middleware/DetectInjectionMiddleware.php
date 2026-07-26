<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Services\AuditLogService;

class DetectInjectionMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function handle(Request $request, Closure $next): Response
    {
        $input = $request->all();

        foreach ($input as $key => $value) {
            $this->scanData($value, (string) $key, $request);
        }

        return $next($request);
    }

    /**
     * Rekursif menscan data input untuk pola SQLi dan XSS.
     */
    protected function scanData(mixed $data, string $key, Request $request): void
    {
        if (is_array($data)) {
            foreach ($data as $subKey => $subValue) {
                $this->scanData($subValue, $key . '.' . $subKey, $request);
            }
            return;
        }

        if (empty($data) || !is_string($data)) {
            return;
        }

        // Pola SQL Injection
        $sqliPatterns = [
            '/union\s+select/i',
            '/select\s+.*\s+from/i',
            '/insert\s+into/i',
            '/drop\s+table/i',
            '/update\s+.*\s+set/i',
            '/delete\s+from/i',
            '/or\s+[\'"]?\w+[\'"]?\s*=\s*[\'"]?\w+[\'"]?/i',
        ];

        foreach ($sqliPatterns as $pattern) {
            if (preg_match($pattern, $data)) {
                AuditLogService::logSqlInjectionAttempt($request->fullUrl());
                return; // Log sekali saja per request untuk menghindari redudansi
            }
        }

        // Pola Cross-Site Scripting (XSS)
        $xssPatterns = [
            '/<script/i',
            '/javascript:/i',
            '/onerror\s*=/i',
            '/onload\s*=/i',
            '/alert\(/i',
            '/eval\(/i',
        ];

        foreach ($xssPatterns as $pattern) {
            if (preg_match($pattern, $data)) {
                AuditLogService::logXssAttempt($key);
                return; // Log sekali saja per request
            }
        }
    }
}
