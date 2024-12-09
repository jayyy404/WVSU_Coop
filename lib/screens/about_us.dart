import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wvsu_coop/screens/custom_app_bar.dart';

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
      appBar: const CustomAppBar(currentPage: 'About Us'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth;

          // Set the number of columns based on screen width
          int crossAxisCount = maxWidth > 800
              ? 3
              : maxWidth > 600
                  ? 2
                  : 1;

          double avatarRadius = maxWidth > 600 ? 90 : 70;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Column(
                      children: [
                        Text(
                          'Meet the Team',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Get to know the creative minds behind our work!',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Team Members Grid
                  GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    shrinkWrap: true, // Shrink the GridView to avoid overflow
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: maxWidth > 600 ? 0.8 : 0.9,
                    ),
                    itemCount: teamMembers.length,
                    itemBuilder: (context, index) {
                      final member = teamMembers[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Profile Image
                          CircleAvatar(
                            backgroundImage: AssetImage(member['image']!),
                            radius: avatarRadius,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            member['name']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                          Text(
                            member['role']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.facebook,
                                  size: 16,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.twitter,
                                  size: 16,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.linkedin,
                                  size: 16,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
