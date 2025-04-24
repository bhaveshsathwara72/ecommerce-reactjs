<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;
use Illuminate\Support\Str;

class CategoriesTableSeeder extends Seeder
{
    public function run()
    {
        $categories = [
            ['name' => 'Sedans', 'slug' => 'sedans', 'image' => 'categories/sedans.jpg'],
            ['name' => 'SUVs', 'slug' => 'suvs', 'image' => 'categories/suvs.jpg'],
            ['name' => 'Trucks', 'slug' => 'trucks', 'image' => 'categories/trucks.jpg'],
            ['name' => 'Hatchbacks', 'slug' => 'hatchbacks', 'image' => 'categories/hatchbacks.jpg'],
            ['name' => 'Coupes', 'slug' => 'coupes', 'image' => 'categories/coupes.jpg'],
            ['name' => 'Convertibles', 'slug' => 'convertibles', 'image' => 'categories/convertibles.jpg'],
            ['name' => 'Electric Vehicles', 'slug' => 'electric', 'image' => 'categories/electric.jpg'],
            ['name' => 'Hybrids', 'slug' => 'hybrids', 'image' => 'categories/hybrids.jpg'],
            ['name' => 'Luxury Cars', 'slug' => 'luxury', 'image' => 'categories/luxury.jpg'],
            ['name' => 'Sports Cars', 'slug' => 'sports', 'image' => 'categories/sports.jpg'],
            ['name' => 'Minivans', 'slug' => 'minivans', 'image' => 'categories/minivans.jpg'],
            ['name' => 'Crossovers', 'slug' => 'crossovers', 'image' => 'categories/crossovers.jpg'],
            ['name' => 'Supercars', 'slug' => 'supercars', 'image' => 'categories/supercars.jpg'],
            ['name' => 'Muscle Cars', 'slug' => 'muscle', 'image' => 'categories/muscle.jpg'],
            ['name' => 'Classic Cars', 'slug' => 'classic', 'image' => 'categories/classic.jpg'],
            ['name' => 'Off-Road Vehicles', 'slug' => 'offroad', 'image' => 'categories/offroad.jpg'],
            ['name' => 'Commercial Vehicles', 'slug' => 'commercial', 'image' => 'categories/commercial.jpg'],
            ['name' => 'Performance Cars', 'slug' => 'performance', 'image' => 'categories/performance.jpg'],
            ['name' => 'Compact Cars', 'slug' => 'compact', 'image' => 'categories/compact.jpg'],
            ['name' => 'Luxury SUVs', 'slug' => 'luxury-suvs', 'image' => 'categories/luxury-suvs.jpg']
        ];

        foreach ($categories as $category) {
            Category::create([
                'name' => $category['name'],
                'slug' => $category['slug'],
                'image' => $category['image']
            ]);
        }
    }
}
