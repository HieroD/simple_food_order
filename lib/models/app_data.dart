import 'dart:convert';
import 'package:http/http.dart' as http;

/// Model untuk kategori makanan
class FoodCategory {
  final String id;
  final String name;
  final String emoji;
  final bool isSelected;

  const FoodCategory({
    required this.id,
    required this.name,
    required this.emoji,
    this.isSelected = false,
  });
}

/// Model untuk restoran
class Restaurant {
  final String id;
  final String name;
  final String cuisine;
  final double rating;
  final String deliveryTime;
  final bool hasFreeDelivery;
  final String imagePath;

  const Restaurant({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.deliveryTime,
    this.hasFreeDelivery = false,
    required this.imagePath,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'].toString(),
      name: json['name'],
      cuisine: json['cuisine'],
      rating: (json['rating'] as num).toDouble(), 
      deliveryTime: json['delivery_time'],
      hasFreeDelivery: json['has_free_delivery'] == true,
      imagePath: json['image_path'],
    );
  }
}

/// Model untuk pesanan yang ditambahkan ke keranjang
class OrderItem {
  final Restaurant restaurant;
  final int quantity;
  final double totalPrice;
  final List<String> selectedToppings;

  OrderItem({
    required this.restaurant,
    required this.quantity,
    required this.totalPrice,
    required this.selectedToppings,
  });
}

/// Data dummy untuk development
class AppData {
  AppData._();

  static List<OrderItem> cartItems = []; 

  static const List<FoodCategory> categories = [
    FoodCategory(id: '1', name: 'makanan',       emoji: '🍢', isSelected: true),
  ];

  static const String baseUrl = 'http://192.168.56.1:8080/api';
  static List<Restaurant> restaurants = [];

  static Future<List<Restaurant>> fetchRestaurants() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/restaurants'));
      print("2. Response status: ${response.statusCode}"); 

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        

        restaurants = jsonList.map((json) => Restaurant.fromJson(json)).toList();

        return restaurants; 
      } else {
        throw Exception('Failed to load restaurants. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the API: $e');
    }
  }
}