<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        // Bind services, singletons, etc. here if needed
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Perform any global bootstrapping here
        // Example: set default string length for older MySQL versions
        // Schema::defaultStringLength(191);
    }
}
