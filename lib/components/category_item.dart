import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  final VoidCallback onTap;

  const CategoryItem({
    Key? key,
    required this.imagePath,
    required this.categoryName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Category Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              width: 150.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          // Category Name
          Text(
            categoryName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            // textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
