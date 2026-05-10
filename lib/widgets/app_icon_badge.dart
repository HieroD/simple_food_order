import 'package:flutter/material.dart';
import '../styles/styles.dart';

/// Widget ikon aplikasi (fork & knife di dalam kotak putih)
class AppIconBadge extends StatelessWidget {
  const AppIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.appIconSize,
      height: AppDimensions.appIconSize,
      decoration: BoxDecoration(
        color: AppColors.iconBackground,
        borderRadius: BorderRadius.circular(AppDimensions.appIconRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.restaurant,
          size: AppDimensions.appIconInnerSize,
          color: AppColors.iconForeground,
        ),
      ),
    );
  }
}