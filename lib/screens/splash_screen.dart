import 'package:flutter/material.dart';
import '../styles/styles.dart';
import '../widgets/widgets.dart';
import 'home_screen.dart';

/// Halaman onboarding utama "Fresh & Fast"
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, animation, __) => const HomeScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.splashGradient,
          ),
        ),
        child: Stack(
          children: [
            _buildFoodBackground(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingXL,
                ),
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    const AppIconBadge(),
                    const SizedBox(height: AppDimensions.paddingL),
                    const Text(
                      'Fresh & Fast',
                      style: AppTextStyles.appTitle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppDimensions.paddingS),
                    const Text(
                      'Delicious meals delivered fast to your door',
                      style: AppTextStyles.tagline,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(flex: 3),
                    _buildCategoryRow(),
                    const Spacer(flex: 2),

                    // ── Navigasi langsung ke Home (skip login) ──
                    Builder(
                      builder: (ctx) => CtaButton(
                        label: 'Get Started →',
                        onTap: () => _goToHome(ctx),
                      ),
                    ),

                    const SizedBox(height: AppDimensions.paddingM),
                    _buildLoginFooter(context),
                    const SizedBox(height: AppDimensions.paddingL),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodBackground() {
    return Positioned.fill(
      child: Opacity(
        opacity: AppDimensions.foodImageOpacity,
        child: Image.asset(
          'assets/images/food_bg.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCategoryRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CategoryCard(icon: Icons.bolt,        label: 'Express'),
        SizedBox(width: AppDimensions.categoryCardSpacing),
        CategoryCard(icon: Icons.restaurant,  label: 'Gourmet'),
        SizedBox(width: AppDimensions.categoryCardSpacing),
        CategoryCard(icon: Icons.eco_rounded, label: 'Fresh'),
      ],
    );
  }

  Widget _buildLoginFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ', style: AppTextStyles.footerText),
        GestureDetector(
          // Log In juga langsung ke Home (skip login)
          onTap: () => _goToHome(context),
          child: Text('Log In', style: AppTextStyles.footerLink),
        ),
      ],
    );
  }
}