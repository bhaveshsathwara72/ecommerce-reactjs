<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use Faker\Factory as Faker;

class ProductsTableSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();
        
        $makes = ['Toyota', 'Honda', 'Ford', 'BMW', 'Mercedes', 'Audi', 'Tesla'];
        $models = ['Camry', 'Accord', 'F-150', '3 Series', 'C-Class', 'A4', 'Model 3'];
        $fuelTypes = ['Petrol', 'Diesel', 'Electric', 'Hybrid'];
        $transmissions = ['Automatic', 'Manual', 'CVT'];
        $conditions = ['New', 'Used', 'Certified Pre-Owned'];

        // Get all category IDs
        $categoryIds = \App\Models\Category::pluck('id')->toArray();
        
        for ($i = 0; $i < 100; $i++) {
            Product::create([
                'name' => $faker->randomElement($makes).' '.$faker->randomElement($models),
                'description' => $faker->text(200),
                'price' => $faker->numberBetween(10000, 100000),
                'stock' => 1,
                'image' => 'default-car.jpg',
                'category_id' => $faker->randomElement($categoryIds),
                'make' => $faker->randomElement($makes),
                'model' => $faker->randomElement($models),
                'year' => $faker->numberBetween(2010, 2023),
                'mileage' => $faker->numberBetween(0, 100000),
                'fuel_type' => $faker->randomElement($fuelTypes),
                'transmission' => $faker->randomElement($transmissions),
                'color' => $faker->colorName,
                'engine_size' => $faker->randomFloat(1, 1.0, 6.0).'L',
                'doors' => $faker->numberBetween(2, 5),
                'seats' => $faker->numberBetween(2, 8),
                'features' => json_encode(['GPS', 'Bluetooth', 'Backup Camera']),
                'vin' => $faker->unique()->regexify('[A-Z0-9]{17}'),
                'condition' => $faker->randomElement($conditions),
            ]);
        }
    }
}
