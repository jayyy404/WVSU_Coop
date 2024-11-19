import 'package:flutter/material.dart';
import '../widgets/team_member_card.dart';

class AboutUsScreen extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {
      'name': 'Raffy Paul Carbo',
      'role': 'Project Manager',
      'image': 'assets/1.png'
    },
    {'name': 'John Paul Sapasap', 'role': 'Developer', 'image': 'assets/2.jpg'},
    {
      'name': 'Jed Andrew Del Rosario',
      'role': 'Frontend Developer',
      'image': 'assets/3.jpg'
    },
    {
      'name': 'Matthew Andrei Valencia',
      'role': 'Marketing Strategist',
      'image': 'assets/4.png'
    },
    {
      'name': 'Cyril Reynold Trojillo',
      'role': 'Business Analyst',
      'image': 'assets/6.jpg'
    },
    {
      'name': 'Joven Carl Rex Biaca',
      'role': 'Quality Assurance',
      'image': 'assets/5.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            Row(
              children: [
                _buildNavButton(context, 'Home', false),
                _buildNavButton(context, 'Stalls', false),
                _buildNavButton(context, 'About Us', true),
                _buildNavButton(context, 'Contact Us', false),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meet the Team',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: teamMembers.length,
                itemBuilder: (context, index) {
                  final member = teamMembers[index];
                  return TeamMemberCard(
                    name: member['name']!,
                    role: member['role']!,
                    imagePath: member['image']!,
                  );
                },
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
}
