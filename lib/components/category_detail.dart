// lib/components/category_detail.dart
import 'package:flutter/material.dart';
import '../models/for_you_item.dart';
import '../components/event_card.dart';
import '../data/mock_data.dart';

class CategoryDetail extends StatelessWidget {
  final String category;
  final VoidCallback onBack;

  const CategoryDetail({
    Key? key,
    required this.category,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // For demonstration, using the same forYouItems. Replace with category-specific data.
    return Column(
      key: ValueKey('categoryDetail_$category'), // Unique key
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with Back Button and Category Title
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 140),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: onBack,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Divider
        Divider(
          color: Colors.grey[700],
          thickness: 1.0,
        ),
        // List of Items for the Selected Category
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            itemCount:
                forYouItems.length, // Replace with category-specific count
            itemBuilder: (context, index) {
              return EventCard(item: forYouItems[index]);
            },
          ),
        ),
      ],
    );
  }
}
