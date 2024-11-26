import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  final String title;
  final String dateLocation;
  final String creatorName;

  const EventDetails({
    Key? key,
    required this.title,
    required this.dateLocation,
    required this.creatorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 0), // 10 vertical, 0 horizontal padding
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns children to the left
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Hosted by: $creatorName",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            dateLocation,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
