<?php

namespace App\Http\Middleware;

use App\Services\AuditLogService;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Session\TokenMismatchException;
use Symfony\Component\HttpFoundation\Response;

class LogInvalidSession
{
    /**
     * Handle an incoming request.
     * Mencatat event 'session_invalid' ketika terjadi CSRF token mismatch
     * atau ketika session tidak valid digunakan.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        try {
            return $next($request);
        } catch (TokenMismatchException $e) {
            // Catat percobaan dengan session/token tidak valid
            AuditLogService::log(
                'session_invalid',
                "Session tidak valid (CSRF mismatch) dari IP: {$request->ip()} pada URL: {$request->fullUrl()}",
                null
            );

            // Re-throw agar Laravel tetap menangani redirect/error seperti biasa
            throw $e;
        }
    }
}
