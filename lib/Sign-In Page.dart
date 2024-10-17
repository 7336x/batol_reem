import 'package:flutter/material.dart';
import 'appPage.dart'; // Import the AppPage where the main content is displayed

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Makes the title bold
            color: Colors.white, // Sets the title color to white
            fontSize: 30, // Adjust the font size
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, // Back arrow icon
            color: Colors.white, // Sets the back arrow color to white
            size: 30, // Adjust the size to make it more prominent
          ),
          onPressed: () {
            Navigator.pop(context); // Action when back arrow is pressed
          },
        ),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
          mainAxisAlignment: MainAxisAlignment.start, // Start from the top vertically
          children: [
            SizedBox(height: 32),

            // Logo Image at the Top Center
            Image.asset(
              'assets/images/logo3.png', // Path to the image
              height: 350, // Set the image height
              width: 350, // Set the image width
            ),
            SizedBox(height: 100), // Space between image and username field

            // Username Field with Icon
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person), // Username Icon
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: false,
            ),
            SizedBox(height: 16),

            // Password Field with Icon
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock), // Password Icon
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true, // Secure field for password
            ),
            SizedBox(height: 24),

            // Additional SizedBox to move the button down
            SizedBox(height: 40), // Adjust this value as needed

            // Sign In Button
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Example validation
                if (username.isEmpty || password.isEmpty) {
                  // Show an error message if username or password is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter your username and password.'),
                    ),
                  );
                } else {
                  // After sign-in, navigate to the AppPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppPage(username: username), // Pass the username
                    ),
                  );
                }
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white, // Set button text color to white
                  fontWeight: FontWeight.bold, // Make button text bold
                  fontSize: 24, // Increase font size
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Increase button padding
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}



