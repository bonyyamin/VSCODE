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
            'assets/banners/banner11.png',
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
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
              itemCount: 5, // Ensure an item count
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
            imagePath: 'assets/gadgets${index + 1}.png',
          ),
          childCount: 10,
        ),
      ),
    );
  }
}

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '4d 12h 30m remaining',
      style: TextStyle(color: Colors.white),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final double originalPrice;
  final double discountedPrice;
  final double rating;
  final String imagePath; // Changed from imageUrl to imagePath

  const ProductCard({
    Key? key,
    required this.title,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
    required this.imagePath, // Update parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/category/gadgets.png", // Use Image.asset instead of Image.network
            fit: BoxFit.cover,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Row(
                  children: [
                    Text('\$$discountedPrice',
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(width: 8),
                    Text('\$$originalPrice',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              decoration: TextDecoration.lineThrough,
                            )),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Text('$rating',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final String discount;

  const CategoryCard({
    Key? key,
    required this.category,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              discount,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _FilterHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              value: 'Newest First',
              items: [
                'Newest First',
                'Price: Low to High',
                'Price: High to Low'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) => onSortChanged(value!),
            ),
          ),
        ],
      ),
    );
  }
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
      margin: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              discount,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class VendorPromosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      // ...existing code...
    );
  }
}
