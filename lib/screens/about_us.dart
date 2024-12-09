import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  AboutUsScreen({super.key});

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth;

          return Column(
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Meet the Team',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Get to know the creative minds behind our work!',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Team Members Grid
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: maxWidth > 1000 ? 200 : 16,
                    vertical: 16.0,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: maxWidth > 1200
                        ? 4
                        : maxWidth > 800
                            ? 3
                            : maxWidth > 600
                                ? 2
                                : 1,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: teamMembers.length,
                  itemBuilder: (context, index) {
                    final member = teamMembers[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(member['image']!),
                          radius: maxWidth > 600 ? 80 : 60,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          member['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          member['role']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const FaIcon(
                                  FontAwesomeIcons.facebook,
                                  size: 16),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.twitter,
                                  size: 16),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.linkedin,
                                  size: 16),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String label, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
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
            color: isActive ? Colors.white : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
