import 'package:flutter/material.dart';
import 'authentication/log_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[850],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left logo
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/coop.jpg'),
                  radius: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'WVSU Canteen',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Navigation items
            Row(
              children: [
                _buildNavButton(context, 'Home', true),
                _buildNavButton(context, 'Stalls', false),
                _buildNavButton(context, 'About Us', false),
                _buildNavButton(context, 'Contact Us', false),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/homepage.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Overlay content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'WELCOME TO WVSU CANTEEN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showSignUpPopup(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Explore Stalls',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String label, bool isActive) {
    return TextButton(
      onPressed: () {
        _showSignUpPopup(context);
      },
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.grey[400],
          fontSize: 16,
        ),
      ),
    );
  }

  void _showSignUpPopup(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return LogInPage(isSignUp: true);
      },
    );
  }
}
