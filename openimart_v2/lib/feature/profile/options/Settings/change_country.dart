import 'package:flutter/material.dart';

class ChangeCountry extends StatefulWidget {
  @override
  _ChangeCountryState createState() => _ChangeCountryState();
}

class _ChangeCountryState extends State<ChangeCountry> {
  String selectedCountry = 'Bangladesh';

  final List<Map<String, String>> countries = [
    {'name': 'Pakistan', 'flag': '🇵🇰'},
    {'name': 'Bangladesh', 'flag': '🇧🇩'},
    {'name': 'Nepal', 'flag': '🇳🇵'},
    {'name': 'Sri Lanka', 'flag': '🇱🇰'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Country'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return ListTile(
            leading: Text(
              country['flag']!,
              style: const TextStyle(fontSize: 24),
            ),
            title: Text(
              country['name']!,
              style: const TextStyle(fontSize: 16),
            ),
            trailing: selectedCountry == country['name']
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () {
              setState(() {
                selectedCountry = country['name']!;
              });
            },
          );
        },
      ),
    );
  }
}
