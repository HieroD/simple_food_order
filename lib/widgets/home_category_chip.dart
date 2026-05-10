import 'package:flutter/material.dart';
import '../models/app_data.dart';
import '../styles/styles.dart';

/// Chip kategori horizontal scroll di halaman Home
class HomeCategoryChip extends StatelessWidget {
  final FoodCategory category;
  final VoidCallback onTap;

  const HomeCategoryChip({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool active = category.isSelected;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: active ? AppColors.homeAccent : AppColors.homeSurface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: active
                      ? AppColors.homeAccent.withOpacity(0.30)
                      : AppColors.cardShadow,
                  blurRadius: active ? 12 : 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                category.emoji,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            category.name,
            style: active
                ? AppTextStyles.homeCategoryLabelActive
                : AppTextStyles.homeCategoryLabel,
          ),
        ],
      ),
    );
  }
}