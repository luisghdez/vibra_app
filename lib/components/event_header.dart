import 'package:flutter/material.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        children: [
          // Background Image
          Container(
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/feed.png'), // Use your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Optional: Add overlay content here
        ],
      ),
    );
  }
}
