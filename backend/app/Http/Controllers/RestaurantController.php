<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreRestaurantRequest;
use App\Http\Requests\UpdateRestaurantRequest;
use App\Models\Restaurant;
use Illuminate\Http\Request;

class RestaurantController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $restaurants = Restaurant::all();
        
        return response()->json($restaurants);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'cuisine' => 'required|string|max:255',
            'rating' => 'required|numeric|between:0,5',
            'delivery_time' => 'required|string|max:50',
            'has_free_delivery' => 'boolean',
            'image_path' => 'nullable|string',
        ]);

        $restaurant = Restaurant::create($validatedData);

        return response()->json($restaurant, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Restaurant $restaurant)
    {
        return response()->json($restaurant);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Restaurant $restaurant)
    {
        $validatedData = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'cuisine' => 'sometimes|required|string|max:255',
            'rating' => 'sometimes|required|numeric|between:0,5',
            'delivery_time' => 'sometimes|required|string|max:50',
            'has_free_delivery' => 'boolean',
            'image_path' => 'nullable|string',
        ]);

        $restaurant->update($validatedData);

        return response()->json($restaurant);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Restaurant $restaurant)
    {
        $restaurant->delete();

        return response()->json(null, 204);
    }
}
