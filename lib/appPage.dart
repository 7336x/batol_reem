import 'package:flutter/material.dart';
import 'ProfilePage.dart'; // Import the ProfilePage

class AppPage extends StatefulWidget {
  final String username; // Store username to pass to ProfilePage

  AppPage({required this.username}); // Constructor to receive username

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  double totalBalance = 10000.00; // Initial total balance
  double accountBalance = 5000.00; // Initial account balance
  double visaBalance = 2500.00; // Initial visa balance
  List<String> actionHistory = []; // List to store action history

  // Method to update balance (for Add, Withdraw, Transfer)
  void _updateBalance(String type, double amount) {
    setState(() {
      if (type == 'add') {
        totalBalance += amount;
        actionHistory.add('Added KD${amount.toStringAsFixed(2)} on ${DateTime.now().toLocal()}'); // Changed to KD
      } else if (type == 'withdraw' && amount <= totalBalance) {
        totalBalance -= amount;
        actionHistory.add('Withdrew KD${amount.toStringAsFixed(2)} on ${DateTime.now().toLocal()}'); // Changed to KD
      } else if (type == 'transfer' && amount <= totalBalance) {
        totalBalance -= amount;
        actionHistory.add('Transferred KD${amount.toStringAsFixed(2)} on ${DateTime.now().toLocal()}'); // Changed to KD
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        title: Text(
          'Premier',
          style: TextStyle(
            color: Colors.white, // Set title color to white
            fontWeight: FontWeight.bold, // Make title bold
          ),
        ),
        backgroundColor: Colors.blue, // AppBar background color
        automaticallyImplyLeading: false, // Remove back arrow
        actions: [
          IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.white, // Set icon color to white
              size: 30, // Set icon size
            ), // List icon
            onPressed: () {
              // Navigate to ProfilePage when icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: widget.username, profileImage: '',), // Pass the username to ProfilePage
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'KD${totalBalance.toStringAsFixed(2)}', // Updated total balance
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Image above Account Card
              Image.asset(
                'images/Premeer.png', // Corrected path for the image
                height: 230, // Increase height to fit well
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),

              // Account ****556 Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    'Account ****556',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    'KD${accountBalance.toStringAsFixed(2)}', // Account balance
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 10, 9, 9),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),

              // Image above Visa Account Card
              Image.asset(
                'images/visa.jpeg', // Corrected path for the image
                height: 250, // Increase height to fit well
                fit: BoxFit.cover,
              ),
              SizedBox(height: 25),

              // Visa Account ****345 Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    'Visa Account ****345',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  subtitle: Text(
                    'KD${visaBalance.toStringAsFixed(2)}', // Visa balance
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Account Statement Card
              Card(
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
                        'Account Statement',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),

                      // Display action history
                      Container(
                        height: 150, // Adjust height as needed
                        child: ListView.builder(
                          itemCount: actionHistory.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(actionHistory[index]),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Background color of the button
                            ),
                            onPressed: () {
                              // Action for Premier Account button
                            },
                            child: Text(
                              'Premier Account',
                              style: TextStyle(
                                color: Colors.white, // Set text color to white
                                fontWeight: FontWeight.bold, // Make text bold
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Background color of the button
                            ),
                            onPressed: () {
                              // Action for Visa Account button
                            },
                            child: Text(
                              'Visa Account',
                              style: TextStyle(
                                color: Colors.white, // Set text color to white
                                fontWeight: FontWeight.bold, // Make text bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Add Funds Card
              _buildActionCard(context, 'Add Funds to Balance', 'Enter the amount to add', (amount) {
                double amt = double.parse(amount);
                _updateBalance('add', amt); // Update the balance when adding funds
              }),
              SizedBox(height: 16),

              // Withdraw Funds Card
              _buildActionCard(context, 'Withdraw Funds from Balance', 'Enter the amount to withdraw', (amount) {
                double amt = double.parse(amount);
                _updateBalance('withdraw', amt); // Update the balance when withdrawing funds
              }),
              SizedBox(height: 16),

              // Transfer Funds Card
              _buildActionCard(context, 'Transfer Funds to Another Account', 'Enter the amount to transfer', (amount) {
                double amt = double.parse(amount);
                _updateBalance('transfer', amt); // Update the balance when transferring funds
              }),
              SizedBox(height: 16),

              // Offers Section (No change here)
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
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // Horizontal scrolling
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
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create action cards for Add, Withdraw, and Transfer
  Widget _buildActionCard(BuildContext context, String title, String hintText, Function(String) onSubmit) {
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
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color of the button
              ),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  onSubmit(_controller.text);
                  _controller.clear(); // Clear the input field
                }
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
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

  OfferCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 160,
        child: Column(
          children: [
            Image.asset(image, fit: BoxFit.cover, height: 100, width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}












