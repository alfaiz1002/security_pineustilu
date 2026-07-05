<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Services\AuditLogService;

class DetectDebugEndpointMiddleware
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
        $path = $request->getPathInfo();

        $debugPatterns = [
            '#^/telescope#i',
            '#^/_debugbar#i',
            '#^/horizon#i',
            '#phpinfo#i',
        ];

        foreach ($debugPatterns as $pattern) {
            if (preg_match($pattern, $path)) {
                AuditLogService::logDebugAccess($request->fullUrl());
                break;
            }
        }

        return $next($request);
    }
}
