import 'package:flutter/material.dart';

class VendorPromos extends StatefulWidget {
  const VendorPromos({Key? key}) : super(key: key);

  @override
  State<VendorPromos> createState() => _VendorPromosState();
}

class _VendorPromosState extends State<VendorPromos> {
  String selectedSort = 'Newest First';
  RangeValues _priceRange = const RangeValues(0, 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildPromoBanner(),
          _buildFiltersSection(),
          _buildFeaturedDeals(),
          _buildCategoryDeals(),
          _buildProductGrid(),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Image.asset(
            'assets/promo_banner.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Winter Sale',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const CountdownTimer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFiltersSection() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _FilterHeaderDelegate(
        child: FilterBar(
          onSortChanged: (value) => setState(() => selectedSort = value),
          onPriceRangeChanged: (values) => setState(() => _priceRange = values),
        ),
      ),
    );
  }

  Widget _buildFeaturedDeals() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Featured Deals',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => PromoCard(
                discount: '50% OFF',
                title: 'Flash Sale',
                endTime: DateTime.now().add(const Duration(hours: 4)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryDeals() {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => CategoryCard(
            category: 'Category ${index + 1}',
            discount: '${(index + 1) * 10}% OFF',
          ),
          childCount: 4,
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => ProductCard(
            title: 'Product ${index + 1}',
            originalPrice: 99.99,
            discountedPrice: 49.99,
            rating: 4.5,
            imageUrl: 'assets/product_${index + 1}.jpg',
          ),
          childCount: 10,
        ),
      ),
    );
  }
}

// Helper Widgets (implement these according to your design system)
class CountdownTimer extends StatelessWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('23:59:59');
  }
}

class FilterBar extends StatelessWidget {
  final Function(String) onSortChanged;
  final Function(RangeValues) onPriceRangeChanged;

  const FilterBar({
    Key? key,
    required this.onSortChanged,
    required this.onPriceRangeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Show filter dialog
            },
          ),
          const Text('Sort by: '),
          DropdownButton<String>(
            items: const [
              'Newest First',
              'Highest Discount',
              'Price: Low to High'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) => onSortChanged(value!),
          ),
        ],
      ),
    );
  }
}

class _FilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _FilterHeaderDelegate({required this.child});

  @override
  Widget build(context, shrinkOffset, overlapsContent) => child;

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant oldDelegate) => false;
}

class PromoCard extends StatelessWidget {
  final String discount;
  final String title;
  final DateTime endTime;

  const PromoCard({
    Key? key,
    required this.discount,
    required this.title,
    required this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(discount, style: Theme.of(context).textTheme.titleLarge),
            Text(title),
            Text('Ends: ${endTime.toString()}'),
          ],
        ),
      ),
    );
  }
}
