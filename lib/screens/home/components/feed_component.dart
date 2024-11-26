import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vibra_app/screens/feed_details/feed_details_screen.dart';

class FeedComponent extends StatelessWidget {
  const FeedComponent({Key? key}) : super(key: key);

  // Example list of items

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Love Your Mine',
      'icon': 'person', // Using string to represent icon names
      'username': '@SamuelLpz',
      'friendsCount': '4',
      'caption': '#lovetoyou #foryourpage #beautiful',
      'participants': [
        {
          'name': 'John',
          'age': 28,
          'hobbies': 'Hiking, Baking, Photography',
          'imagePath': 'assets/john_doe.jpg',
        },
        {
          'name': 'Jane',
          'age': 25,
          'hobbies': 'Reading, Traveling, Painting',
          'imagePath': 'assets/jane_smith.jpg',
        },
        {
          'name': 'Alice',
          'age': 30,
          'hobbies': 'Coding, Running, Cooking',
          'imagePath': 'assets/alice_johnson.jpg',
        },
        {
          'name': 'Bob',
          'age': 27,
          'hobbies': 'Gaming, Music, Traveling',
          'imagePath': 'assets/bob_brown.jpg',
        }
        // Add more participants as needed
      ],
      'comments': [
        {
          'name': 'Dylan',
          'text': 'Best event of the year!',
          'likes': 3,
          'imagePath': 'assets/dylan.jpg',
        },
        {
          'name': 'Sofia',
          'text': 'Had so much fun. Can\'t wait for next year.',
          'likes': 4,
          'imagePath': 'assets/sofia.jpg',
        },
        {
          'name': 'Jack',
          'text': 'Good vibes, great music.',
          'likes': 5,
          'imagePath': 'assets/jack.jpg',
        },
        // Add more comments as needed
      ],
    },
    {
      'title': 'Another Post',
      'icon': 'favorite',
      'username': '@GabyRgl',
      'friendsCount': '10',
      'caption': '#flutter #dart #programming',
      'participants': [
        {
          'name': 'Alice',
          'age': 30,
          'hobbies': 'Coding, Running, Cooking',
          'imagePath': 'assets/alice_johnson.jpg',
        },
        {
          'name': 'Bob',
          'age': 27,
          'hobbies': 'Gaming, Music, Traveling',
          'imagePath': 'assets/bob_brown.jpg',
        },
        // Add more participants as needed
      ],
      'comments': [
        {
          'name': 'Michael',
          'text': 'Amazing content!',
          'likes': 2,
          'imagePath': 'assets/michael.jpg',
        },
        {
          'name': 'Emma',
          'text': 'Very informative, thanks for sharing.',
          'likes': 5,
          'imagePath': 'assets/emma.jpg',
        },
        // Add more comments as needed
      ],
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FeedDetailsScreen(item: item),
              ),
            );
          },
          child: SizedBox(
            height: 380, // Fixed height for each item
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.black, // Base color
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
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
                                    Colors
                                        .transparent, // Transparent at the top
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
                                borderRadius: BorderRadius.circular(
                                    28), // Adjust as needed
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
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
                                              '+ ${item['friendsCount']} New friends', // Assuming friendsCount is a number
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
          ),
        );
      },
    );
  }
}
