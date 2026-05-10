import 'package:flutter/material.dart';
import '../styles/styles.dart';

/// Model lokal untuk satu item pencarian terbaru
class _RecentItem {
  final String query;
  _RecentItem(this.query);
}

/// Halaman Search – dark theme
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  int _activeTagIndex = 0;

  final List<String> _suggestedTags = [
    'Sate Ayam',
    'Rawon',
    'Bakmi Jawa',
    'Nasi Goreng',
    'Minuman',
  ];

  final List<_RecentItem> _recentSearches = [
    _RecentItem('Sate Ayam Madura'),
    _RecentItem('Rawon Setan'),
    _RecentItem('Bakmi Goreng Jawa'),
  ];


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _removeRecent(int index) {
    setState(() => _recentSearches.removeAt(index));
  }

  void _clearAll() {
    setState(() => _recentSearches.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                ),
                children: [
                  const SizedBox(height: AppDimensions.paddingM),
                  _buildSearchInput(),
                  const SizedBox(height: AppDimensions.paddingL),
                  _buildSuggestedTags(),
                  const SizedBox(height: AppDimensions.paddingXL),
                  if (_recentSearches.isNotEmpty) ...[
                    _buildRecentSearches(),
                    const SizedBox(height: AppDimensions.paddingXL),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Sub-widgets ─────────────────────────────────────────────────

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.paddingL,
        AppDimensions.paddingM,
        AppDimensions.paddingL,
        0,
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.homeAccent, width: 2),
              color: AppColors.homeSurface,
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/avatar.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.person,
                  color: AppColors.homeAccent,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Brand name
          Text('Fresh & Fast', style: AppTextStyles.searchScreenTitle),

          const Spacer(),

          // Keranjang
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.homeSurface,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.homeAccent,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.searchBackground,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded,
              color: AppColors.homeTextMuted, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              style: AppTextStyles.searchScreenInputText.copyWith(color: AppColors.homeTextPrimary),
              cursorColor: AppColors.homeAccent,
              decoration: InputDecoration(
                hintText: 'Cari makanan atau restoran...',
                hintStyle: AppTextStyles.searchScreenInputHint,
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (_controller.text.isNotEmpty)
            GestureDetector(
              onTap: () => setState(() => _controller.clear()),
              child: const Icon(Icons.close,
                  color: AppColors.homeTextMuted, size: 18),
            ),
        ],
      ),
    );
  }

  Widget _buildSuggestedTags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Disarankan untuk Anda',
            style: AppTextStyles.searchScreenSection),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_suggestedTags.length, (i) {
            final active = i == _activeTagIndex;
            return GestureDetector(
              onTap: () => setState(() => _activeTagIndex = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: active
                      ? AppColors.searchTagActive
                      : AppColors.searchTagInactive,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusFull),
                  border: Border.all(
                    color: active
                        ? AppColors.searchTagActive
                        : AppColors.searchScreenBorder,
                    width: 1,
                  ),
                ),
                child: Text(
                  _suggestedTags[i],
                  style: active
                      ? AppTextStyles.searchTagActive
                      : AppTextStyles.searchTagInactive,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pencarian Terbaru',
                style: AppTextStyles.searchScreenSection),
            GestureDetector(
              onTap: _clearAll,
              child: Text('Hapus Semua', style: AppTextStyles.clearAll),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...List.generate(_recentSearches.length, (i) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.homeSurface,
              borderRadius:
                  BorderRadius.circular(AppDimensions.radiusM),
              border: Border.all(
                  color: AppColors.divider, width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.history_rounded,
                    color: AppColors.homeTextSecondary, size: 18),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(_recentSearches[i].query,
                      style: AppTextStyles.recentSearchText),
                ),
                GestureDetector(
                  onTap: () => _removeRecent(i),
                  child: const Icon(Icons.close,
                      color: AppColors.homeTextMuted, size: 16),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildBigBannerCard(Map<String, String> data) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      child: SizedBox(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Gambar latar
            Image.asset(
              data['image']!,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: AppColors.homeSurface,
                child: const Icon(Icons.restaurant,
                    color: AppColors.homeAccent, size: 48),
              ),
            ),
            // Gradasi overlay
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.transparent, Color(0xCC000000)],
                ),
              ),
            ),
            // Teks
            Positioned(
              bottom: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['label']!,
                      style: AppTextStyles.bannerTitle),
                  if (data['sublabel']!.isNotEmpty)
                    Text(data['sublabel']!,
                        style: AppTextStyles.bannerSubtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallCard(Map<String, String> data) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      child: SizedBox(
        height: 100,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              data['image']!,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: AppColors.homeSurface,
                child: const Icon(Icons.restaurant,
                    color: AppColors.homeAccent, size: 32),
              ),
            ),
            // Dark overlay
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xBB000000)],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(data['label']!,
                  style: AppTextStyles.popularCategoryLabel),
            ),
          ],
        ),
      ),
    );
  }
}