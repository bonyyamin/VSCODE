import 'package:flutter/material.dart';

class PaymentOptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Options"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Choose a Payment Option",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: [
                      PaymentOptionCard(
                        isMobile: isMobile,
                        icon: Icons.money,
                        title: "Cash on Delivery",
                        description: "Pay when you receive your order.",
                        terms:
                            "Available for orders below \$500. Ensure to have exact change.",
                      ),
                      PaymentOptionCard(
                        isMobile: isMobile,
                        icon: Icons.credit_card,
                        title: "Card Payment",
                        description: "Pay using your debit or credit card.",
                        terms:
                            "Secure payment gateway. Cards must be 3D secure enabled.",
                      ),
                      PaymentOptionCard(
                        isMobile: isMobile,
                        icon: Icons.account_balance,
                        title: "Bank Transfer",
                        description:
                            "Transfer funds directly to our bank account.",
                        terms:
                            "Include your order ID in the transfer notes. Processing may take 1-2 business days.",
                      ),
                      PaymentOptionCard(
                        isMobile: isMobile,
                        icon: Icons.mobile_friendly,
                        title: "Mobile Wallet",
                        description:
                            "Pay conveniently using your favorite mobile wallet.",
                        terms:
                            "Supported wallets include PayPal, Google Pay, and Apple Pay.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final bool isMobile;
  final IconData icon;
  final String title;
  final String description;
  final String terms;

  const PaymentOptionCard({
    Key? key,
    required this.isMobile,
    required this.icon,
    required this.title,
    required this.description,
    required this.terms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: isMobile ? 24 : 32,
                  backgroundColor: Colors.purple[100],
                  child: Icon(icon,
                      color: Colors.purple, size: isMobile ? 24 : 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            ExpansionTile(
              title: const Text(
                "Terms & Conditions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    terms,
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
