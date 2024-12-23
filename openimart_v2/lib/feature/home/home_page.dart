import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:openimart_v2/feature/home/widget/voucher_and_discount.dart'; // Import the SponsoredSection widget
import 'package:openimart_v2/feature/home/widget/top_buttons.dart'; // Add this import
import 'package:openimart_v2/feature/home/widget/flash_sale_widget.dart'; // Add this import
import 'package:openimart_v2/feature/message/message_page.dart';
import 'package:openimart_v2/feature/cart/cart_page.dart';
import 'package:openimart_v2/feature/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    _HomeContent(),
    MessagePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Move existing HomePage content to a new widget
class _HomeContent extends StatelessWidget {
  // Sample banner images - replace with your actual images
  final List<String> bannerImages = [
    'assets/banners/banner1.png',
    'assets/banners/banner2.png',
    'assets/banners/banner3.png',
    'assets/banners/banner4.png',
    'assets/banners/banner5.png',
    'assets/banners/banner6.png',
  ];

  final List<String> tabs = [
    'For You',
    'Best Deals',
    'New Arrival',
    'Popular',
    'Top Rated'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blueAccent.shade700,
            Colors.white,
          ],
          stops: [0.0, 0.3], // Gradient ends at 30% of screen height
        ),
      ),
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 0,
              ),
              SliverToBoxAdapter(
                child: _buildLocationSelection(),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickySearchBarDelegate(
                  child: _buildSearchBar(),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _SlidingBanner(
                      bannerImages: bannerImages,
                      height: 200,
                    ),
                    const SizedBox(height: 8),
                    const TopButtons(), // Add this
                    const SizedBox(height: 8), // Add this
                    VoucherAndDiscount(),
                    const SizedBox(height: 8),
                    FlashSale(items: [
                      {
                        'image': 'assets/flash_sale/item1.png',
                        'discount': '50%',
                        'price': '\$49.99',
                        'originalPrice': '\$99.99',
                        'stock': '70'
                      },
                      // Add more items as needed
                    ]),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: _StickyTabBarDelegate(
                  TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                  ),
                ),
                pinned: true,
              ),
            ],
            body: TabBarView(
              children: [
                _buildForYouTab(),
                _buildProductListTab(),
                _buildProductListTab(),
                _buildProductListTab(),
                _buildProductListTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationSelection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deliver to:",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              Text(
                "Select delivery location >",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for products, brands and more",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          prefixIcon: Icon(Icons.search, color: Colors.blue),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.camera_alt, color: Colors.black54),
              SizedBox(width: 10),
              Icon(Icons.mic, color: Colors.black54),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForYouTab() {
    return ListView(
      children: [
        _buildFeaturedCards(),
        _buildCarouselBanner(),
        _buildLazyProductList(),
        // Add SponsoredSection widget here
      ],
    );
  }

  Widget _buildProductListTab() {
    return ListView.builder(
      itemCount: 20, // Replace with actual product count
      itemBuilder: (context, index) {
        return ProductCard(); // Create a separate ProductCard widget
      },
    );
  }

  Widget _buildFeaturedCards() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: Container(
              width: 100,
              // Add your featured card content
            ),
          );
        },
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
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10, // Replace with actual product count
      itemBuilder: (context, index) {
        return ProductCard(); // Create a separate ProductCard widget
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        height: 120,
        // Add your product card implementation
      ),
    );
  }
}

class _SlidingBanner extends StatefulWidget {
  final List<String> bannerImages;
  final double height;

  const _SlidingBanner({
    required this.bannerImages,
    required this.height,
  });

  @override
  State<_SlidingBanner> createState() => _SlidingBannerState();
}

class _SlidingBannerState extends State<_SlidingBanner> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  void _startTimer() {
    if (widget.bannerImages.isNotEmpty) {
      _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (_currentPage < widget.bannerImages.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.bannerImages.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.bannerImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerImages.length, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 50 : 8,
              height: 6,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _StickySearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _StickySearchBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Safe area top padding
    final double topSafeArea = MediaQuery.of(context).padding.top;

    // Calculate scroll percentage (0.0 to 1.0)
    final double scrollPercentage =
        (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    // Additional padding that increases with scroll (0 to 15)
    final double additionalPadding = 15 * scrollPercentage;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blueAccent.shade700,
            Colors.blueAccent.shade700.withOpacity(0.9),
          ],
        ),
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: topSafeArea + additionalPadding,
        bottom: 8,
      ),
      child: child,
    );
  }

  @override
  double get maxExtent => 110;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _StickyTabBarDelegate(this.tabBar);

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => 45;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
