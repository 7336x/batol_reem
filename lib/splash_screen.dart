import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAADBF4), // Updated background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/logo2.jpeg', // Path to your image
                width: 350, // Updated size of the circle
                height: 350,
                fit: BoxFit.cover, // Fit image within the circular shape
              ),
            ),
            SizedBox(height: 20), // Space between image and text
            Text(
              'Burgan Bank',
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 35, // Font size
                fontWeight: FontWeight.bold, // Bold font
              ),
            ),
          ],
        ),
      ),
    );
  }
}
