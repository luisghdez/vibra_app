import 'dart:ui';

import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  // Example list of items
  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Love your mine',
      'icon': Icons.person,
      'username': '@SamuelLpz',
      'friendsCount': '+ 4 New Friends',
      'caption': '#lovetoyou #foryourpage #beautiful'
    },
    // Add more items as needed
    {
      'title': 'Another Post',
      'icon': Icons.favorite,
      'username': '@JaneDoe',
      'friendsCount': '+ 10 New Friends',
      'caption': '#flutter #dart #programming'
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return SizedBox(
          height: 380, // Fixed height for each item
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.black, // Base color
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Background image layer
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/feed.png', // Ensure this path is correct
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 90, // Adjust the height as needed
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(
                                      1), // Dark color at the bottom
                                  Colors.transparent, // Transparent at the top
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Content layer
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top row with profile picture, username, and friends count in one container
                        Row(
                          children: [
                            // Combined container with blurred background
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(22), // Adjust as needed
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 14),
                                  color: Colors.black.withOpacity(
                                      0.2), // Low opacity for background
                                  child: Row(
                                    children: [
                                      // Profile picture
                                      const CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage(
                                          'assets/avatar7.png', // Ensure this path is correct
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      // Username and friends count
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['username'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            '${item['friendsCount']} friends', // Assuming friendsCount is a number
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            // Top-right icon with blurred background
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  color: Colors.black.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.bed, // Replace with desired icon
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Bottom caption
                        Text(
                          item['caption'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
