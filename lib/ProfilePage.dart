import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String username; // Username passed from the previous page
  final String? profileImage; // Image path passed from the SignUpPage

  ProfilePage({required this.username, this.profileImage});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _birthdayController.text = 'YYYY-MM-DD'; // Default placeholder for birthday
  }

  // Function to save the updated information
  void _saveProfile() {
    // Logic to save profile data
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Circular Profile Image
            ClipOval(
              child: Image.asset(
                widget.profileImage ?? 'images/default_profile.png', // Use default image if none provided
                height: 100, // Set the height of the circular image
                width: 100, // Set the width of the circular image
                fit: BoxFit.cover, // Cover the circle with the image
              ),
            ),
            SizedBox(height: 20),

            // Display the username
            Text(
              'Username: ${widget.username}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Birthday Field
            TextField(
              controller: _birthdayController,
              decoration: InputDecoration(
                labelText: 'Birthday (YYYY-MM-DD)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),

            // Phone Number Field
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),

            // Email Field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),

            // Address Field
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            // Save Profile Button
            ElevatedButton(
              onPressed: _saveProfile, // Call the save function
              child: Text(
                'Save Profile',
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontWeight: FontWeight.bold, // Make text bold
                  fontSize: 18, // Increase font size
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: EdgeInsets.symmetric(vertical: 16), // Increase button height
                textStyle: TextStyle(
                  fontSize: 18, // Increase text size
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}



