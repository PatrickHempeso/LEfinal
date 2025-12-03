<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class StudentMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $user = $request->user();

        // Check if authenticated user exists and is a student
        if (!$user || !is_a($user, \App\Models\Student::class)) {
            return response()->json(['message' => 'Forbidden: Not a student'], 403);
        }

        return $next($request);
    }
}
