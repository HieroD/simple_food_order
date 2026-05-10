import 'package:flutter/material.dart';
import '../models/app_data.dart';
import '../styles/styles.dart';
import '../widgets/widgets.dart';
import 'food_detail_screen.dart';
import 'order_screen.dart';

/// Halaman utama Home – shell navigasi bottom tab
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  List<Widget> get _pages => [
        const _HomePage(),
        const OrdersScreen(),
        const _PlaceholderPage(icon: Icons.person_rounded, label: 'Profile'),
      ];

  @override
  Widget build(BuildContext context) {
    // Bottom nav warna menyesuaikan tab aktif
    final bool isDark = false;

    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      body: IndexedStack(index: _navIndex, children: _pages),
      bottomNavigationBar: _BottomNav(
        currentIndex: _navIndex,
        isDark: isDark,
        onTap: (i) => setState(() => _navIndex = i),
      ),
    );
  }
}

// Bottom Nav Bar
class _BottomNav extends StatelessWidget {
  final int currentIndex;
  final bool isDark;
  final ValueChanged<int> onTap;

  const _BottomNav({
    required this.currentIndex,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      {'icon': Icons.home_rounded, 'label': 'Home'},
      {'icon': Icons.receipt_long_rounded, 'label': 'Orders'},
      {'icon': Icons.person_rounded, 'label': 'Profile'},
    ];

    final bgColor =
        isDark ? AppColors.searchNavDark : AppColors.navBarBackground;
    final borderColor =
        isDark ? AppColors.searchNavDarkBorder : AppColors.divider;
    final inactiveColor =
        isDark ? AppColors.searchScreenMuted : AppColors.navBarInactive;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(top: BorderSide(color: borderColor, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final active = i == currentIndex;
          return GestureDetector(
            onTap: () => onTap(i),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: active ? AppColors.homeAccent : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    items[i]['icon'] as IconData,
                    size: 22,
                    color: active ? Colors.white : inactiveColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  items[i]['label'] as String,
                  style: AppTextStyles.navLabel.copyWith(
                    color: active ? AppColors.homeAccent : inactiveColor,
                    fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// ── Halaman Home (konten)
class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  int _selectedCategoryIndex = 0;
  late List<FoodCategory> _categories;

  @override
  void initState() {
    super.initState();
    _rebuildCategories(0);
  }

  void _rebuildCategories(int selected) {
    _categories = AppData.categories
        .asMap()
        .entries
        .map((e) => FoodCategory(
              id: e.value.id,
              name: e.value.name,
              emoji: e.value.emoji,
              isSelected: e.key == selected,
            ))
        .toList();
  }

  void _onCategoryTap(int index) {
    setState(() {
      _selectedCategoryIndex = index;
      _rebuildCategories(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: _buildHeader()),
          SliverToBoxAdapter(child: _buildSearchBar()),
          SliverToBoxAdapter(
              child: _buildSectionHeader(
            title: 'Kategori',
            actionLabel: 'Lihat Semua',
            onAction: () {},
          )),
          SliverToBoxAdapter(child: _buildCategoryRow()),
          SliverToBoxAdapter(
              child: _buildSectionHeader(
            title: 'Restoran Populer',
            actionLabel: 'Lihat Peta',
            onAction: () {},
          )),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingL,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => RestaurantCard(
                  restaurant: AppData.restaurants[i],
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => FoodDetailScreen(
                        restaurant: AppData.restaurants[i],
                      ),
                    ),
                  ),
                ),
                childCount: AppData.restaurants.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.paddingL)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.paddingL,
        AppDimensions.paddingM,
        AppDimensions.paddingL,
        AppDimensions.paddingS,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text('ANTAR KE', style: AppTextStyles.deliverTo),
                  const SizedBox(width: 2),
                  const Icon(Icons.location_on,
                      size: 11, color: AppColors.homeTextSecondary),
                ]),
                const SizedBox(height: 2),
                Row(children: [
                  Text('Surabaya, Jawa Timur',
                      style: AppTextStyles.locationTitle),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: AppColors.homeAccent, size: 22),
                ]),
              ],
            ),
          ),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.homeAccent, width: 2),
              color: AppColors.homeAccentLight,
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/avatar.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.person,
                  color: AppColors.homeAccent,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingL,
        vertical: AppDimensions.paddingS,
      ),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: AppColors.searchBackground,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
        ),
        child: Row(children: [
          const Icon(Icons.search_rounded,
              color: AppColors.homeTextMuted, size: 22),
          const SizedBox(width: 10),
          Text('Mau makan apa hari ini?', style: AppTextStyles.searchHint),
        ]),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required String actionLabel,
    required VoidCallback onAction,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.paddingL,
        AppDimensions.paddingL,
        AppDimensions.paddingL,
        AppDimensions.paddingS,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.sectionTitle),
          GestureDetector(
            onTap: onAction,
            child: Text(actionLabel, style: AppTextStyles.sectionAction),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRow() {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingL,
        ),
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (_, i) => HomeCategoryChip(
          category: _categories[i],
          onTap: () => _onCategoryTap(i),
        ),
      ),
    );
  }
}

// ── Placeholder tab
class _PlaceholderPage extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PlaceholderPage({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: AppColors.homeAccent),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.homeTextSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
