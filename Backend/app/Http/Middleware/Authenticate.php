<?php

namespace App\Http\Middleware;
use Illuminate\Auth\Middleware\Authenticate as Middleware;

class Authenticate extends Middleware
{
    protected function redirectTo($request)
    {
        // For API requests, return 401 JSON instead of redirect
        if ($request->expectsJson()) {
            return null;
        }
        // Optional: you can redirect web users
        return route('login');
    }
}