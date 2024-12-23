import 'package:flutter/material.dart';

class HomeTabBarView extends StatelessWidget {
  final List<String> tabs = [
    'For You',
    'Best Deals',
    'New Arrival',
    'Popular',
    'Top Rated'
  ];

  HomeTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildForYouTab(),
                _buildProductListTab(),
                _buildProductListTab(),
                _buildProductListTab(),
                _buildProductListTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForYouTab() {
    return ListView(
      children: [
        _buildFeaturedCards(),
        _buildCarouselBanner(),
        _buildLazyProductList(),
      ],
    );
  }

  Widget _buildProductListTab() {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _buildProductCard(context, index);
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(BuildContext context, int index) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              'https://picsum.photos/200',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product ${index + 1}',
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${(index + 1) * 10}.99',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedCards() {
    return Builder(
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          padding: const EdgeInsets.all(8.0),
          itemCount: 10,
          itemBuilder: (context, index) => _buildProductCard(context, index),
        ),
      ),
    );
  }

  Widget _buildCarouselBanner() {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 10),
      // Add your carousel banner implementation
    );
  }

  Widget _buildLazyProductList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildProductCard(context, index);
      },
    );
  }
}
