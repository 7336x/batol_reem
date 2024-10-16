import 'package:flutter/material.dart';
import 'ProfilePage.dart'; // Import the ProfilePage

class AppPage extends StatelessWidget {
  final String username; // Store username to pass to ProfilePage

  AppPage({required this.username}); // Constructor to receive username

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        title: Text('Main Dashboard'),
        backgroundColor: Colors.blue, // AppBar background color
        actions: [
          IconButton(
            icon: Icon(Icons.list), // List icon
            onPressed: () {
              // Navigate to ProfilePage when icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                      username: username), // Pass the username to ProfilePage
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Make the page scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Total Balance Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    'Total Balance',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '\$10,000.00', // Example total balance
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Account ****556 Card with Balance
              Card(
                elevation: 4,
                color:
                    Color(0xFF01A1E4), // Background color for the account card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    'Account ****556',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    '\$5,000.00', // Display account balance here
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Visa Account ****345 Card with Balance
              Card(
                elevation: 4,
                color: Color(0xFF016CAC), // Background color for the visa card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    'Visa Account ****345',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    '\$2,500.00', // Display visa account balance here
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Add Funds Card
              _buildActionCard(
                  context, 'Add Funds to Balance', 'Enter the amount to add',
                  (amount) {
                print("Add Funds: $amount"); // Logic for adding funds
              }),
              SizedBox(height: 16),

              // Withdraw Funds Card
              _buildActionCard(context, 'Withdraw Funds from Balance',
                  'Enter the amount to withdraw', (amount) {
                print("Withdraw Funds: $amount"); // Logic for withdrawing funds
              }),
              SizedBox(height: 16),

              // Transfer Funds Card
              _buildActionCard(context, 'Transfer Funds to Another Account',
                  'Enter the amount to transfer', (amount) {
                print(
                    "Transfer Funds: $amount"); // Logic for transferring funds
              }),
              SizedBox(height: 16),

              // Offers Section
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Offers',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection:
                            Axis.horizontal, // Horizontal scrolling
                        children: [
                          OfferCard(
                            image: 'assets/images/1.jpeg',
                            title: 'Exclusive Offer 1',
                          ),
                          OfferCard(
                            image: 'assets/images/2.jpeg',
                            title: 'Exclusive Offer 2',
                          ),
                          OfferCard(
                            image: 'assets/images/3.jpeg',
                            title: 'Exclusive Offer 3',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Open Saving Account Card
              Card(
                elevation: 4,
                color: Color(
                    0xFFF79138), // Background color for the saving account card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    'Open Saving Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create action cards for Add, Withdraw, and Transfer
  Widget _buildActionCard(BuildContext context, String title, String hintText,
      Function(String) onSubmit) {
    final TextEditingController _controller = TextEditingController();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: hintText,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                String amount = _controller.text;
                onSubmit(amount); // Call the function with the entered amount
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String image;
  final String title;

  const OfferCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        child: Column(
          children: [
            Image.asset(
              image,
              height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
