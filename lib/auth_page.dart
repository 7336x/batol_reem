import 'package:flutter/material.dart';
import 'sign_up_page.dart'; // Import the sign-up page
// import 'Sign_In_page.dart'; // Import the sign-in page
import 'package:batol_reem/Sign-In Page.dart';

class AuthPage extends StatelessWidget {
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
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to SignUpPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              icon: Icon(Icons.person_add, size: 30), // Icon for Sign Up
              label: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 35, // Font size
                  fontWeight: FontWeight.bold, // Bold font
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.blue, // Button color
              ),
            ),
            SizedBox(height: 20), // Space between buttons
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to SignInPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              icon: Icon(Icons.login, size: 30), // Icon for Sign In
              label: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 35, // Font size
                  fontWeight: FontWeight.bold, // Bold font
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.blue, // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
