import 'package:flutter/material.dart';
import 'package:wvsu_coop/screens/custom_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(currentPage: 'Contact Us'),
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
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 2;  

                double horizontalPadding = 16.0;

                if (constraints.maxWidth > 1000) {
                  crossAxisCount = 2;
                  horizontalPadding = 200;
                }

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1, 
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
                );
              },
            ),
          ],
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
                  onTap: () {
                   // Handle link tap
                  },
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
