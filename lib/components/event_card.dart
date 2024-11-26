// lib/components/event_card.dart
import 'package:flutter/material.dart';
import '../models/for_you_item.dart';

class EventCard extends StatelessWidget {
  final ForYouItem item;

  const EventCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.grey[900], // Background color for visibility
      child: Row(
        children: [
          // Left-side image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              item.imageUrl,
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0), // Spacing between image and text
          // Right-side text content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Add padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '${item.creator} and ${item.friendsCount} friends',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    '${item.date}, ${item.time}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    item.location,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
