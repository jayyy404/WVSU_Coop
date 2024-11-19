import 'package:flutter/material.dart';

class StallCard extends StatelessWidget {
  final String name;
  final String priceRange;
  final String description;
  final String imagePath;

  const StallCard({
    required this.name,
    required this.priceRange,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$priceRange\n$description'),
        isThreeLine: true,
      ),
    );
  }
}
