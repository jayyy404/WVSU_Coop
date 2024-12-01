import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[850],
        elevation: 0,
        leading: null,
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
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            // Navigation items
            Row(
              children: [
                _buildNavButton(context, 'Home', false),
                _buildNavButton(context, 'Stalls', false),
                _buildNavButton(context, 'About Us', false),
                _buildNavButton(context, 'Contact Us', true),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  'How can we serve you today?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'At our university COOP canteen, we strive to offer you a delicious variety of meals and snacks to fuel your day. Whether you’re in between classes or taking a break, we’ve got something for everyone. Browse our menu and find your favorite dishes, from quick bites to hearty meals.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Contact Info Grid Section
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200.0),
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 4 / 3,
                  ),
                  children: [
                    _buildContactBox(
                      icon: Icons.location_on,
                      title: 'OUR MAIN OFFICE',
                      content: 'West Visayas State University',
                    ),
                    _buildContactBox(
                      icon: Icons.phone,
                      title: 'PHONE NUMBER',
                      content: '09358934576\n09914499687',
                    ),
                    _buildContactBox(
                      icon: Icons.access_time,
                      title: 'Operating Hours',
                      content: 'Monday to Saturday\n6AM - 6PM',
                    ),
                    _buildContactBox(
                      icon: Icons.email,
                      title: 'EMAIL',
                      content: 'wvsu.coop@gmail.com',
                      isLink: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String label, bool isActive) {
    return TextButton(
      onPressed: () {
        switch (label) {
          case 'Home':
            Navigator.pushNamed(context, '/');
            break;
          case 'Stalls':
            Navigator.pushNamed(context, '/stalls');
            break;
          case 'About Us':
            Navigator.pushNamed(context, '/about_us');
            break;
          case 'Contact Us':
            Navigator.pushNamed(context, '/contact_us');
            break;
        }
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

  Widget _buildContactBox({
    required IconData icon,
    required String title,
    required String content,
    bool isLink = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.indigo,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          isLink
              ? GestureDetector(
                  onTap: () {},
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.indigo,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              : Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
        ],
      ),
    );
  }
}
