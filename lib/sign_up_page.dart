import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'Sign-In Page.dart'; // Import the SignInPage to navigate after sign-up

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _civilIdController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  File? _selectedImage;

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path); // Update the selected image
      });
    }
  }

  // Function to validate the fields and navigate to SignInPage
  void _signUp() {
    final civilId = _civilIdController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // Validate Civil ID
    if (civilId.length != 12 || !RegExp(r'^[0-9]+$').hasMatch(civilId)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Civil ID must be exactly 12 digits and numeric')),
      );
      return;
    }

    // Validate other fields
    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Validate password match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    // Store the username and password, then navigate to SignInPage
    UserCredentials.username = username; // Store the username
    UserCredentials.password = password; // Store the password
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignInPage(), // Navigate to SignInPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/logo3.png',
              height: 350,
              width: 350,
            ),
            SizedBox(height: 100),

            // Civil ID Number Field
            TextField(
              controller: _civilIdController,
              decoration: InputDecoration(
                labelText: 'Civil ID Number',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
              obscureText: false,
            ),
            SizedBox(height: 16),

            // Username Field
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: false,
            ),
            SizedBox(height: 16),

            // Password Field
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),

            // Confirm Password Field
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),

            // Image Picker Button
            ElevatedButton(
              onPressed: _pickImage,
              child: Text(
                'Choose an Image',
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontWeight: FontWeight.bold, // Make text bold
                  fontSize: 18, // Increase font size
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: EdgeInsets.symmetric(vertical: 16), // Increase button height
              ),
            ),
            SizedBox(height: 16),

            // Display the selected image
            if (_selectedImage != null)
              Image.file(
                _selectedImage!,
                height: 150,
                width: 150,
              ),
            SizedBox(height: 16),

            // Sign Up Button
            ElevatedButton(
              onPressed: _signUp,
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontWeight: FontWeight.bold, // Make text bold
                  fontSize: 18, // Increase font size
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: EdgeInsets.symmetric(vertical: 16), // Increase button height
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _civilIdController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

class UserCredentials {
  static String password = ''; // Static variable to hold the password
  static String username = ''; // Static variable to hold the username
}



