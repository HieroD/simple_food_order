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
}

/// Data dummy untuk development
class AppData {
  AppData._();

  static const List<FoodCategory> categories = [
    FoodCategory(id: '1', name: 'makanan',       emoji: '🍢', isSelected: true),

  ];

  static const List<Restaurant> restaurants = [
    Restaurant(
      id: '1',
      name: 'Sate Ayam Pak Kumis',
      cuisine: 'Jawa • Sate Ayam',
      rating: 4.9,
      deliveryTime: '15–25 min',
      hasFreeDelivery: true,
      imagePath: 'assets/images/sate_ayam.png',
    ),
    Restaurant(
      id: '2',
      name: 'Rawon Setan Surabaya',
      cuisine: 'Jawa Timur • Rawon',
      rating: 4.8,
      deliveryTime: '20–30 min',
      hasFreeDelivery: false,
      imagePath: 'assets/images/rawon.png',
    ),
    Restaurant(
      id: '3',
      name: 'Bakmi Jawa Mbah Hadi',
      cuisine: 'Jawa • Bakmi Goreng',
      rating: 4.7,
      deliveryTime: '20–35 min',
      hasFreeDelivery: true,
      imagePath: 'assets/images/bakmi_jawa.png',
    ),
    Restaurant(
      id: '4',
      name: 'Nasi Goreng Kambing Kebon Sirih',
      cuisine: 'Betawi • Nasi Goreng',
      rating: 4.6,
      deliveryTime: '10–20 min',
      hasFreeDelivery: false,
      imagePath: 'assets/images/nasi_goreng.png',
    ),
  ];
}