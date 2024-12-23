import 'package:flutter/material.dart';
import 'package:openimart_v2/account/login_page.dart';
import 'package:openimart_v2/feature/home/home_page.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  final List<Map<String, String>> languages = [
    {'icon': 'ह', 'label': 'हिंदी'},
    {'icon': 'త', 'label': 'తెలుగు'},
    {'icon': 'த', 'label': 'தமிழ்'},
    {'icon': 'A', 'label': 'English'},
    {'icon': 'ব', 'label': 'বাংলা'},
    {'icon': 'म', 'label': 'मराठी'},
    {'icon': 'ಕ', 'label': 'ಕನ್ನಡ'},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Which language do you want to see Flipkart in?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final language = languages[index];
                return _buildLanguageCard(
                  language['icon']!,
                  language['label']!,
                  selectedIndex == index,
                  () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
          if (selectedIndex != null)
            _buildSubmitButton(context, selectedIndex!),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF2874F0),
      elevation: 0,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Row(
            children: const [
              Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
      title: Row(
        children: const [
          Text(
            'Flipkart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildProgressIndicator(),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStepIndicator(1, 'Language', true),
            _buildProgressLine(),
            const SizedBox(width: 16.0),
            _buildStepIndicator(2, 'Login', false),
            const SizedBox(width: 16.0),
            _buildProgressLine(),
            _buildStepIndicator(3, 'Welcome', false),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildStepIndicator(int step, String title, bool isActive) {
    return Column(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isActive ? Colors.white : Colors.blue[200],
          child: Text(
            '$step',
            style: TextStyle(
              color: isActive ? Colors.blue : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressLine() {
    return Container(
      width: 100,
      height: 1,
      margin: const EdgeInsets.only(bottom: 17.0),
      color: Colors.white,
    );
  }

  Widget _buildLanguageCard(
      String icon, String label, bool isHighlighted, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: isHighlighted ? Colors.blue[50] : Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(
              icon,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          title: Text(
            label,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          trailing: Icon(
            isHighlighted ? Icons.check_circle : Icons.arrow_forward_ios,
            color: isHighlighted ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, int selectedIndex) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2874F0),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: selectedIndex >= 0
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(
                        selectedLanguageIndex: selectedIndex,
                      ),
                    ),
                  );
                }
              : null, // Button disabled if no language selected
          child: const Text(
            'SUBMIT',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
