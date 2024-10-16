import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import your SplashScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          SplashScreen(), // Use the SplashScreen class from splash_screen.dart
    );
  }
}
