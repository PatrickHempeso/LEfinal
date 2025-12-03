<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EnsureStudent
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        /** @var \Illuminate\Contracts\Auth\Guard $auth */
        $auth = auth();

        if (!$auth->check() || $auth->user()->role !== 'student') {
            abort(403, 'Access denied');
        }

        return $next($request);
    }
}
