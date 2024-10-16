import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import your SplashScreen
import 'auth_page.dart'; // Import your AuthPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Optional: Remove the debug banner
      title: 'Burgan Bank App', // Set your app title here
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary color for your app
      ),
      home: SplashScreen(), // Start with SplashScreen
    );
  }
}
