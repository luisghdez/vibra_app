import 'dart:ui';
import 'package:flutter/material.dart';

class ParticipantCard extends StatelessWidget {
  final Map<String, dynamic> participant;

  const ParticipantCard({Key? key, required this.participant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(
                    'assets/avatar7.png'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with details (transparent overlay)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(0),
            ),
          ),
          // Participant Details with Blur
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 8, left: 10, right: 6, bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        "${participant['name']}, ${participant['age'].toString()}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        participant['hobbies'],
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
