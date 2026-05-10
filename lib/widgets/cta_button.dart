import 'package:flutter/material.dart';
import '../styles/styles.dart';

/// Tombol CTA utama "Get Started →"
class CtaButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CtaButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.ctaButtonHeight,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.buttonText,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.ctaButtonRadius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingXL,
          ),
        ),
        child: Text(label, style: AppTextStyles.ctaButton),
      ),
    );
  }
}