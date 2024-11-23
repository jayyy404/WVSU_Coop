import 'package:flutter/material.dart';

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;

  TeamMemberCard({
    required this.name,
    required this.role,
    required this.imagePath,
    required String image,
    required BoxFit fit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(role, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
