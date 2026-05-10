import 'package:flutter/material.dart';

/// Semua warna aplikasi Fresh & Fast
class AppColors {
  AppColors._();

  // ── Primary Orange Palette ──────────────────────────────────────
  static const Color primaryOrange      = Color(0xFFFF7A00);
  static const Color primaryOrangeLight = Color(0xFFFF9A3C);
  static const Color primaryOrangeDark  = Color(0xFFE56500);

  // ── Gradient ────────────────────────────────────────────────────
  static const List<Color> splashGradient = [
    Color(0xFFFF9A3C),
    Color(0xFFFF7A00),
    Color(0xFFE55A00),
  ];

  // ── Category Card (Splash) ───────────────────────────────────────
  static const Color cardBackground = Color(0x33FFFFFF);
  static const Color cardBorder     = Color(0x55FFFFFF);

  // ── Button ──────────────────────────────────────────────────────
  static const Color buttonBackground = Color(0xFFFFFFFF);
  static const Color buttonText       = Color(0xFF1A1A1A);

  // ── Text (Splash) ────────────────────────────────────────────────
  static const Color textPrimary   = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xCCFFFFFF);
  static const Color textMuted     = Color(0x99FFFFFF);
  static const Color textLink      = Color(0xFFFFFFFF);

  // ── Icon ────────────────────────────────────────────────────────
  static const Color iconBackground = Color(0xFFFFFFFF);
  static const Color iconForeground = Color(0xFFFF7A00);

  // ── Home Screen ─────────────────────────────────────────────────
  static const Color homeBackground    = Color(0xFFF7F7F7);
  static const Color homeSurface       = Color(0xFFFFFFFF);
  static const Color homeTextPrimary   = Color(0xFF1A1A1A);
  static const Color homeTextSecondary = Color(0xFF888888);
  static const Color homeTextMuted     = Color(0xFFAAAAAA);
  static const Color homeAccent        = Color(0xFFFF7A00);
  static const Color homeAccentLight   = Color(0xFFFFF3E8);
  static const Color freeDeliveryColor = Color(0xFF00B074);
  static const Color ratingStarColor   = Color(0xFFFFB800);
  static const Color searchBackground  = Color(0xFFEEEEEE);
  static const Color navBarBackground  = Color(0xFFFFFFFF);
  static const Color navBarActive      = Color(0xFFFF7A00);
  static const Color navBarInactive    = Color(0xFFBBBBBB);
  static const Color cardShadow        = Color(0x0F000000);
  static const Color divider           = Color(0xFFEEEEEE);

  // ── Search Screen (dark theme) ───────────────────────────────────
  static const Color searchScreenBg       = Color(0xFF1A1A2E);
  static const Color searchScreenSurface  = Color(0xFF252540);
  static const Color searchScreenCard     = Color(0xFF2E2E50);
  static const Color searchScreenBorder   = Color(0xFF3A3A60);
  static const Color searchScreenText     = Color(0xFFFFFFFF);
  static const Color searchScreenSubtext  = Color(0xFF9999BB);
  static const Color searchScreenMuted    = Color(0xFF666688);
  static const Color searchScreenInput    = Color(0xFF2A2A48);
  static const Color searchTagActive      = Color(0xFFFF7A00);
  static const Color searchTagInactive    = Color(0xFF2E2E50);
  static const Color searchTagActiveTxt   = Color(0xFFFFFFFF);
  static const Color searchTagInactiveTxt = Color(0xFF9999BB);
  static const Color searchNavDark        = Color(0xFF1A1A2E);
  static const Color searchNavDarkBorder  = Color(0xFF2A2A48);
  static const Color searchClearAll       = Color(0xFFFF7A00);
  static const Color searchBannerOverlay  = Color(0xCC000000);
}