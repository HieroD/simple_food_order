import 'package:flutter/material.dart';
import '../models/app_data.dart';
import '../styles/styles.dart';

/// Kartu restoran di halaman Home
class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final VoidCallback? onTap;

  const RestaurantCard({
    super.key,
    required this.restaurant,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: AppColors.homeSurface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          boxShadow: const [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // ── Gambar restoran ──────────────────────────────────
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft:     Radius.circular(AppDimensions.radiusL),
                bottomLeft:  Radius.circular(AppDimensions.radiusL),
              ),
              child: _buildImage(),
            ),

            // ── Info restoran ────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurant.name,   style: AppTextStyles.restaurantName),
                    const SizedBox(height: 2),
                    Text(restaurant.cuisine, style: AppTextStyles.restaurantCuisine),
                    const SizedBox(height: 10),
                    _buildMetaRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(
        restaurant.imagePath,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: AppColors.homeAccentLight,
          child: const Icon(
            Icons.restaurant,
            color: AppColors.homeAccent,
            size: 36,
          ),
        ),
      ),
    );
  }

  Widget _buildMetaRow() {
    return Row(
      children: [
        // Rating
        const Icon(Icons.star, size: 13, color: AppColors.ratingStarColor),
        const SizedBox(width: 3),
        Text(restaurant.rating.toString(), style: AppTextStyles.restaurantMeta),
        const SizedBox(width: 10),

        // Waktu pengiriman
        const Icon(Icons.access_time_rounded, size: 13, color: AppColors.homeTextMuted),
        const SizedBox(width: 3),
        Text(restaurant.deliveryTime, style: AppTextStyles.restaurantMeta),

        // Free delivery badge
        if (restaurant.hasFreeDelivery) ...[
          const SizedBox(width: 8),
          Text('Free Delivery', style: AppTextStyles.freeDelivery),
        ],
      ],
    );
  }
}