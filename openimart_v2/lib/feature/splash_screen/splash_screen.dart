import 'dart:async';
import 'package:flutter/material.dart';
import 'package:openimart_v2/feature/welcome/language_selection_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LanguageSelectionPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.gif', // Replace with your logo path
          width: 150, // Adjust size as needed
          height: 150,
        ),
      ),
    );
  }
}
