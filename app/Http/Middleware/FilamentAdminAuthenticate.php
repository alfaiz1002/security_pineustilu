<?php

namespace App\Http\Middleware;

use Closure;
use Filament\Facades\Filament;
use Filament\Models\Contracts\FilamentUser;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FilamentAdminAuthenticate extends Middleware
{

    public function handle($request, Closure $next, ...$guards)
    {
        $guard = $guards[0] ?? null;

        if (!Auth::guard($guard)->check()) {
            return redirect()->route('home');
        }

        $user = Auth::guard($guard)->user();

        if ($user instanceof FilamentUser) {
            if (! $user->canAccessPanel(Filament::getCurrentPanel())) {
                return redirect()->route('home');
            }
        }

        return $next($request);
    }


    protected function redirectTo(Request $request): ?string
    {
        return $request->expectsJson() ? null : route('home');
    }
}
