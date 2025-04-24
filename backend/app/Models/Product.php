<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use App\Models\Category;
use App\Models\OrderItem;

class Product extends Model
{
    protected $fillable = [
        'name',
        'description',
        'price',
        'stock',
        'image',
        'category_id',
        // New fields for car products
        'make',
        'model',
        'year',
        'mileage',
        'fuel_type',
        'transmission',
        'color',
        'engine_size',
        'doors',
        'seats',
        'features',
        'vin',
        'condition',
        'image' // Changed to plural for multiple images
    ];

    protected $casts = [
        'image' => 'array',
        'features' => 'array'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function carts()
    {
        return $this->hasMany(Cart::class);
    }
}