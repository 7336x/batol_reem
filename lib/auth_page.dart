import 'package:flutter/material.dart';
import 'sign_up_page.dart'; // Import the sign-up page
import 'package:batol_reem/Sign-In Page.dart'; // Import the sign-in page

class AuthPage extends StatelessWidget {
  // Function to create a common button style
  ElevatedButton _buildAuthButton(BuildContext context, String label, IconData icon, Widget page) {
    return ElevatedButton.icon(
      onPressed: () {
        // Navigate to the specified page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      icon: Icon(
        icon,
        size: 30,
        color: Colors.white, // Set icon color to white
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white, // Text color
          fontSize: 30, // Font size
          fontWeight: FontWeight.bold, // Bold font
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        backgroundColor: Colors.blue, // Button color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAADBF4), // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/logo2.jpeg', // Path to your image
                width: 350, // Size of the circle
                height: 350,
                fit: BoxFit.cover, // Fit image within the circular shape
              ),
            ),
            SizedBox(height: 40), // Space between image and buttons
            // Using the common button style for both buttons
            _buildAuthButton(context, 'Sign Up', Icons.person_add, SignUpPage()),
            SizedBox(height: 20), // Space between buttons
            _buildAuthButton(context, 'Sign In', Icons.login, SignInPage()),
          ],
        ),
      ),
    );
  }
}

