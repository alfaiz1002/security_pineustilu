<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SecurityHeadersMiddleware
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
        $response = $next($request);

        $response->headers->set('Strict-Transport-Security', 'max-age=31536000; includeSubDomains');
        $response->headers->set('X-Frame-Options', 'SAMEORIGIN');
        $response->headers->set('X-Content-Type-Options', 'nosniff');
        $response->headers->set('Referrer-Policy', 'strict-origin-when-cross-origin');
        $response->headers->set('Permissions-Policy', 'geolocation=(), microphone=(), camera=()');

        // CSP yang mendukung Vite HMR (http & ws di local) serta domain eksternal + CSP Violation Reporting
        $csp = "default-src 'self' http: https: data: blob: 'unsafe-inline' 'unsafe-eval'; " .
               "script-src 'self' http: https: 'unsafe-inline' 'unsafe-eval'; " .
               "style-src 'self' http: https: 'unsafe-inline'; " .
               "font-src 'self' http: https: data:; " .
               "connect-src 'self' http: https: ws: wss:; " .
               "img-src 'self' http: https: data: blob:; " .
               "frame-src 'self' http: https:; " .
               "report-uri /api/csp-report;";

        $response->headers->set('Content-Security-Policy', $csp);

        return $response;
    }
}
