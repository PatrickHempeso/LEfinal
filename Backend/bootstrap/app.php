<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Http\Middleware\StudentMiddleware;
use App\Http\Middleware\FacultyMiddleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        // Register your route aliases for role-based middleware
        $middleware->alias([
            'student' => StudentMiddleware::class
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        // Optional: configure global exception handling here
    })
    ->create();
