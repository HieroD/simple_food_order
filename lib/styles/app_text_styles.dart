import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Semua gaya teks aplikasi Fresh & Fast
class AppTextStyles {
  AppTextStyles._();

  // ── Brand / Logo ────────────────────────────────────────────────
  static const TextStyle appTitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 30,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
    height: 1.2,
  );

  // ── Tagline / Subtitle ──────────────────────────────────────────
  static const TextStyle tagline = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // ── Category Label (Splash) ──────────────────────────────────────
  static const TextStyle categoryLabel = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );

  // ── CTA Button ──────────────────────────────────────────────────
  static const TextStyle ctaButton = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.buttonText,
    letterSpacing: 0.2,
  );

  // ── Footer / Legal ──────────────────────────────────────────────
  static const TextStyle footerText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static const TextStyle footerLink = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textLink,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.textLink,
  );

  // ── Home Screen ─────────────────────────────────────────────────
  static const TextStyle deliverTo = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.homeTextSecondary,
    letterSpacing: 0.4,
  );

  static const TextStyle locationTitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.homeTextPrimary,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.homeTextPrimary,
  );

  static const TextStyle sectionAction = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.homeAccent,
  );

  static const TextStyle homeCategoryLabel = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.homeTextSecondary,
  );

  static const TextStyle homeCategoryLabelActive = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.homeAccent,
  );

  static const TextStyle restaurantName = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.homeTextPrimary,
  );

  static const TextStyle restaurantCuisine = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.homeTextSecondary,
  );

  static const TextStyle restaurantMeta = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.homeTextSecondary,
  );

  static const TextStyle freeDelivery = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.freeDeliveryColor,
  );

  static const TextStyle searchHint = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.homeTextMuted,
  );

  static const TextStyle navLabel = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  // ── Search Screen (dark) ─────────────────────────────────────────
  static const TextStyle searchScreenTitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.homeAccent,
    letterSpacing: -0.3,
  );

  static const TextStyle searchScreenSection = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.homeTextPrimary,
  );

  static const TextStyle searchScreenInputText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.homeTextPrimary,
  );

  static const TextStyle searchScreenInputHint = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.homeTextMuted,
  );

  static const TextStyle searchTagActive = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.searchTagActiveTxt,
  );

  static const TextStyle searchTagInactive = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.homeTextSecondary,
  );

  static const TextStyle recentSearchText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.homeTextPrimary,
  );

  static const TextStyle clearAll = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.searchClearAll,
  );

  static const TextStyle bannerTitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    shadows: [Shadow(color: Colors.black54, blurRadius: 6)],
  );

  static const TextStyle bannerSubtitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
  );

  static const TextStyle popularCategoryLabel = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    shadows: [Shadow(color: Colors.black87, blurRadius: 6)],
  );
}