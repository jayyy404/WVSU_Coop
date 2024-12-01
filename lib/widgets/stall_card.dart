import 'package:flutter/material.dart';

class StallCard extends StatelessWidget {
  final String name;
  final String priceRange;
  final String description;
  final String imagePath;

  const StallCard({super.key, 
    required this.name,
    required this.priceRange,
    required this.description,
    required this.imagePath,
  });

  Clip get clipBehavior => Clip.hardEdge;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: SizedBox(
              height: 120.0, // Adjust the height as needed
              width: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitHeight, // Ensure the image fills the space
              ),
            ),
          ),
          ListTile(
            title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('$priceRange\n$description'),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}
