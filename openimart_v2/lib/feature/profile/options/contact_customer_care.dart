import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCustomerCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Customer Care"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
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
                  "How can we assist you?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 2 : 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    children: [
                      ContactOption(
                        icon: Icons.phone,
                        label: "Call Us",
                        onTap: () => _makePhoneCall('tel:+1234567890'),
                      ),
                      ContactOption(
                        icon: Icons.chat,
                        label: "Live Chat",
                        onTap: () {
                          // Handle live chat navigation or integration
                        },
                      ),
                      ContactOption(
                        icon: Icons.email,
                        label: "Email Us",
                        onTap: () => _sendEmail('mailto:support@example.com'),
                      ),
                      ContactOption(
                        icon: Icons.help_center,
                        label: "FAQs",
                        onTap: () {
                          // Navigate to FAQs screen or external FAQ page
                        },
                      ),
                      ContactOption(
                        icon: Icons.feedback,
                        label: "Submit Query",
                        onTap: () {
                          // Navigate to query submission form
                        },
                      ),
                      ContactOption(
                        icon: Icons.location_on,
                        label: "Visit Us",
                        onTap: () => _openMap(),
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

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _sendEmail(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _openMap() async {
    const url = 'https://www.google.com/maps?q=customer+care+location';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ContactOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ContactOption({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
