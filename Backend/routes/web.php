<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GuestController;

Route::prefix('api')->group(function () {
    Route::get('/dashboard/guest', [GuestController::class, 'dashboard']);
    Route::get('/document/{id}', [GuestController::class, 'viewDocument']);
    Route::get('/guest/document/{id}', [GuestController::class, 'viewDocument']);
});

Route::get('/{any}', function () {
    return view('react.index');
})->where('any', '^(?!api).*$'); 
