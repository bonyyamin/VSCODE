import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPromotionalSection(),
              const SizedBox(height: 24),
              _buildUserEngagementSection(),
              const SizedBox(height: 24),
              _buildRewardsSection(),
              const SizedBox(height: 24),
              _buildCtaSection(),
              const SizedBox(height: 24),
              _buildFooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromotionalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Current Promotions',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _promotionCard(
                'Summer Sale',
                'Up to 50% off on seasonal items',
                'assets/images/summer_sale.png',
              ),
              _promotionCard(
                'Flash Deal',
                'Next flash sale in 2 hours',
                'assets/images/flash_sale.png',
              ),
              _promotionCard(
                'Style Challenge',
                'Share your look & win',
                'assets/images/challenge.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserEngagementSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Community',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _customerStoryCard(),
        const SizedBox(height: 16),
        _pollCard(),
      ],
    );
  }

  Widget _buildRewardsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Rewards',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text('Current Points: 2,500'),
          const SizedBox(height: 8),
          const Text('Member Status: Gold'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('View Exclusive Deals'),
          ),
        ],
      ),
    );
  }

  Widget _buildCtaSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ctaButton('Join Contest', () {}),
        _ctaButton('Redeem Rewards', () {}),
        _ctaButton('Shop Now', () {}),
      ],
    );
  }

  Widget _buildFooterSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: () {}, child: const Text('FAQs')),
            TextButton(onPressed: () {}, child: const Text('Support')),
            TextButton(onPressed: () {}, child: const Text('Terms')),
          ],
        ),
        const SizedBox(height: 16),
        _newsletterSubscription(),
      ],
    );
  }

  Widget _promotionCard(String title, String description, String imageAsset) {
    return Card(
      margin: const EdgeInsets.only(right: 16),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }

  Widget _customerStoryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Customer Story',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Sarah found her perfect style with us...'),
          ],
        ),
      ),
    );
  }

  Widget _pollCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick Poll',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('What\'s your favorite category?'),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                _pollOption('Fashion'),
                _pollOption('Beauty'),
                _pollOption('Home'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pollOption(String text) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
    );
  }

  Widget _ctaButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  Widget _newsletterSubscription() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Stay Updated',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Subscribe'),
            ),
          ],
        ),
      ),
    );
  }
}
