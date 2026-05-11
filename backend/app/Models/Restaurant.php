<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Restaurant extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'cuisine',
        'rating',
        'delivery_time',
        'has_free_delivery',
        'image_path',
    ];

    protected $casts = [
        'rating' => 'float',
        'has_free_delivery' => 'boolean',
    ];
}