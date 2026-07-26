<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Services\AuditLogService;

class BlockHiddenFiles
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $path = $request->getPathInfo();

        // Cek apakah URL path mengandung segmen yang diawali dengan titik (hidden file/folder)
        // Contoh: /.env, /public/.htaccess, /.git/config
        if (preg_match('/(^|\/)\./', $path)) {
            // Izinkan .well-known untuk Let's Encrypt SSL
            if (strpos($path, '/.well-known/') === 0) {
                return $next($request);
            }

            AuditLogService::log(
                'sensitive_file_access',
                "Percobaan akses ke '{$path}' dari IP: {$request->ip()}",
                null
            );

            return abort(403, 'Access Denied: You do not have permission to access hidden files.');
        }

        return $next($request);
    }
}
