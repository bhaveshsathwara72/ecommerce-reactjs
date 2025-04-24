<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'name',
        'slug',
        'description',
        'image' // Add this line
    ];

    public function products()
    {
        return $this->hasMany(Product::class);
    }
}