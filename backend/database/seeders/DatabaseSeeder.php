<?php

namespace Database\Seeders;

use App\Models\Restaurant;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        $restaurants = [
            [
                'name' => 'Sate Ayam Pak Kumis',
                'cuisine' => 'Jawa • Sate Ayam',
                'rating' => 4.9,
                'delivery_time' => '15-25 min',
                'has_free_delivery' => true,
                'image_path' => 'assets/images/sate_ayam.png',
            ],
            [
                'name' => 'Rawon Setan Surabaya',
                'cuisine' => 'Jawa Timur • Rawon',
                'rating' => 4.8,
                'delivery_time' => '20-30 min',
                'has_free_delivery' => false,
                'image_path' => 'assets/images/rawon.png',
            ],
            [
                'name' => 'Bakmi Jawa Mbah Hadi',
                'cuisine' => 'Jawa • Bakmi Goreng',
                'rating' => 4.7,
                'delivery_time' => '20-35 min',
                'has_free_delivery' => true,
                'image_path' => 'assets/images/bakmi_jawa.png',
            ],
            [
                'name' => 'Nasi Goreng Kambing Kebon Sirih',
                'cuisine' => 'Betawi • Nasi Goreng',
                'rating' => 4.6,
                'delivery_time' => '10-20 min',
                'has_free_delivery' => false,
                'image_path' => 'assets/images/nasi_goreng.png',
            ],
        ];

        foreach ($restaurants as $restaurant) {
            Restaurant::create($restaurant);
        }
    }
}
