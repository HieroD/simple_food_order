import 'package:flutter/material.dart';
import '../styles/styles.dart';

/// Widget kartu kategori (Express / Gourmet / Fresh)
class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.categoryCardWidth,
      height: AppDimensions.categoryCardHeight,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1.2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: AppDimensions.categoryIconSize,
            color: AppColors.textPrimary,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: AppTextStyles.categoryLabel,
          ),
        ],
      ),
    );
  }
}