<?php
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AdminAuthController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\CartController;
use Illuminate\Support\Facades\Route;


// Public routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login'])->name('login');

// Admin  Routes
Route::post('/admin/login', [AdminAuthController::class, 'login'])->name('admin.login');
Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/latest', [ProductController::class, 'latest']);
Route::get('/products/{product}', [ProductController::class, 'show']);
Route::get('/categories/latest', [CategoryController::class, 'latest']);
Route::get('/categories', [CategoryController::class, 'index']);
Route::get('/categories/{category}', [CategoryController::class, 'show']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    
    // Admin  Routes
    Route::get('/verify', [AdminAuthController::class, 'verify']);
    Route::get('/admin/verify', [AdminAuthController::class, 'verify']);
    Route::post('/admin/logout', [AdminAuthController::class, 'logout']);
    Route::get('orders/all', [OrderController::class,'all']);
    Route::apiResource('orders', OrderController::class);
    Route::post('products/{product}', [ProductController::class, 'update']);
    Route::apiResource('products', ProductController::class)->except(['index', 'show']);
    Route::apiResource('users', UserController::class);
    Route::apiResource('cart', CartController::class);
    Route::apiResource('categories', CategoryController::class)->except(['index', 'show']);
    Route::post('categories/{category}', [CategoryController::class, 'update']);
    Route::put('/admin/orders/{order}/status', [OrderController::class, 'updateStatus']);
});
