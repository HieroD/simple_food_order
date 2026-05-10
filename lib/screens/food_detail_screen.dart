import 'package:flutter/material.dart';
import '../models/app_data.dart';
import '../styles/styles.dart';

/// Model topping tambahan
class _Topping {
  final String id;
  final String name;
  final double price;
  final String imagePath;
  bool isSelected;

  _Topping({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    this.isSelected = false,
  });
}

/// Halaman Detail Makanan + Add to Cart
class FoodDetailScreen extends StatefulWidget {
  final Restaurant restaurant;

  const FoodDetailScreen({super.key, required this.restaurant});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _quantity = 1;
  final double _basePrice = 35000;

  final List<_Topping> _toppings = [
    _Topping(
      id: '1',
      name: 'Lontong',
      price: 3000,
      imagePath: 'assets/images/lontong.jpg',
    ),
    _Topping(
      id: '2',
      name: 'Kecap Manis Extra',
      price: 2000,
      imagePath: 'assets/images/kecap.jpg',
    ),
    _Topping(
      id: '3',
      name: 'Sate Telur Puyuh',
      price: 5000,
      imagePath: 'assets/images/telur_puyuh.jpg',
    ),
  ];

  double get _toppingTotal =>
      _toppings.where((t) => t.isSelected).fold(0, (s, t) => s + t.price);

  double get _totalPrice => (_basePrice + _toppingTotal) * _quantity;

  String _formatRupiah(double value) {
    final str = value.toStringAsFixed(0);
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) buffer.write('.');
      buffer.write(str[i]);
    }
    return 'Rp ${buffer.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      body: Stack(
        children: [
          // ── Scrollable content ─────────────────────────────────
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildHeroImage(context),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.homeSurface,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppDimensions.radiusXL),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppDimensions.paddingL),
                      _buildTitleSection(),
                      _buildDivider(),
                      _buildDescription(),
                      _buildDivider(),
                      _buildQuantityRow(),
                      _buildDivider(),
                      _buildToppingsSection(),
                      // Ruang untuk tombol bawah
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ── Tombol Add to Cart (sticky bottom) ─────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildAddToCartButton(),
          ),
        ],
      ),
    );
  }

  // ── Sub-widgets ──────────────────────────────────────────────────

  Widget _buildHeroImage(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 260,
      pinned: true,
      backgroundColor: AppColors.homeBackground,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: AppColors.homeSurface,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.homeTextPrimary, size: 18),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: AppColors.homeSurface,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.favorite_border_rounded,
                color: AppColors.homeAccent, size: 20),
            onPressed: () {},
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          widget.restaurant.imagePath,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: AppColors.homeAccentLight,
            child: const Icon(Icons.restaurant,
                color: AppColors.homeAccent, size: 64),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.homeTextPrimary,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                _formatRupiah(_basePrice),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.homeAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star_rounded,
                  color: AppColors.ratingStarColor, size: 16),
              const SizedBox(width: 4),
              Text(
                widget.restaurant.rating.toString(),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.homeTextPrimary,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.access_time_rounded,
                  color: AppColors.homeTextMuted, size: 14),
              const SizedBox(width: 4),
              Text(
                widget.restaurant.deliveryTime,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.homeTextSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingL,
          vertical: AppDimensions.paddingM),
      child: Text(
        'Nikmati cita rasa autentik ${widget.restaurant.name} yang lezat, '
        'disajikan dengan bumbu khas pilihan, arang bara yang sempurna, '
        'dan bahan-bahan segar berkualitas tinggi.',
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.homeTextSecondary,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildQuantityRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingL,
          vertical: AppDimensions.paddingM),
      child: Row(
        children: [
          const Text(
            'Jumlah',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.homeTextPrimary,
            ),
          ),
          const Spacer(),
          // Tombol −
          _QuantityButton(
            icon: Icons.remove,
            onTap: () {
              if (_quantity > 1) setState(() => _quantity--);
            },
            isActive: false,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              '$_quantity',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.homeTextPrimary,
              ),
            ),
          ),
          // Tombol +
          _QuantityButton(
            icon: Icons.add,
            onTap: () => setState(() => _quantity++),
            isActive: true,
          ),
        ],
      ),
    );
  }

  Widget _buildToppingsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tambahan',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.homeTextPrimary,
            ),
          ),
          const SizedBox(height: 12),
          ..._toppings.map((topping) => _ToppingItem(
                topping: topping,
                onChanged: (val) => setState(() => topping.isSelected = val),
                formatPrice: _formatRupiah,
              )),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.paddingL,
        AppDimensions.paddingM,
        AppDimensions.paddingL,
        AppDimensions.paddingL,
      ),
      decoration: BoxDecoration(
        color: AppColors.homeSurface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.homeAccent,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.radiusFull),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_cart_outlined, size: 20),
              const SizedBox(width: 10),
              Text(
                'beli sekarang — ${_formatRupiah(_totalPrice)}',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() => Container(
        height: 1,
        margin: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingL),
        color: AppColors.divider,
      );
}

// ── Tombol quantity ± ────────────────────────────────────────────────
class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isActive ? AppColors.homeAccent : AppColors.searchBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isActive ? Colors.white : AppColors.homeTextSecondary,
        ),
      ),
    );
  }
}

// ── Baris item topping ───────────────────────────────────────────────
class _ToppingItem extends StatelessWidget {
  final _Topping topping;
  final ValueChanged<bool> onChanged;
  final String Function(double) formatPrice;

  const _ToppingItem({
    required this.topping,
    required this.onChanged,
    required this.formatPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: topping.isSelected
            ? AppColors.homeAccentLight
            : AppColors.homeBackground,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(
          color: topping.isSelected
              ? AppColors.homeAccent.withOpacity(0.4)
              : AppColors.divider,
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          // Gambar topping
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusS),
            child: SizedBox(
              width: 48,
              height: 48,
              child: Image.asset(
                topping.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.homeAccentLight,
                  child: const Icon(Icons.fastfood,
                      color: AppColors.homeAccent, size: 24),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Nama & harga
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topping.name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.homeTextPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '+${formatPrice(topping.price)}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.homeTextSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Checkbox
          GestureDetector(
            onTap: () => onChanged(!topping.isSelected),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: topping.isSelected
                    ? AppColors.homeAccent
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: topping.isSelected
                      ? AppColors.homeAccent
                      : AppColors.homeTextMuted,
                  width: 2,
                ),
              ),
              child: topping.isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}