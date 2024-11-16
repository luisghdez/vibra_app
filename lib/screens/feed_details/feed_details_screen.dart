import 'dart:ui'; // Required for ImageFilter
import 'package:flutter/material.dart';

class FeedDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const FeedDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Fixed EventHeader at the bottom layer
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: EventHeader(),
          ),

          // 2. Scrollable content that overlays the EventHeader
          SingleChildScrollView(
            padding: EdgeInsets.zero, // No additional padding
            child: Column(
              children: [
                // Spacer to allow the EventHeader to be fully visible initially
                const SizedBox(height: 400),

                // 3. Content with opacity, blur effect, and rounded corners
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                    child: ClipRect(
                      // Clip the backdrop filter to this container
                      child: BackdropFilter(
                        // Apply blur only to this section
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const EventDetails(
                                title: 'Little Thommy',
                                dateLocation: 'Fri, Dec 31 · San Francisco, CA',
                              ),
                              const SizedBox(height: 16),
                              ParticipantsSection(
                                  participants: item['participants']),
                              const SizedBox(height: 16),
                              CommentsSection(comments: item['comments']),
                              const SizedBox(height: 16),
                              const AddCommentSection(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Event Header Component
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
                image: AssetImage(
                    'assets/feed.png'), // Use the image as background
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Overlay
        ],
      ),
    );
  }
}

// Event Details Component
class EventDetails extends StatelessWidget {
  final String title;
  final String dateLocation;

  const EventDetails({
    Key? key,
    required this.title,
    required this.dateLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 0), // 10 vertical, 6 horizontal padding
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
            dateLocation,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// Participants Section Component
class ParticipantsSection extends StatelessWidget {
  final List<Map<String, dynamic>> participants;

  const ParticipantsSection({Key? key, required this.participants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Who Went?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 250, // Adjusted height for vertical cards
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: participants.length,
            itemBuilder: (context, index) {
              final participant = participants[index];
              return ParticipantCard(participant: participant);
            },
          ),
        ),
      ],
    );
  }
}

// Participant Card Componentor using BackdropFilter

class ParticipantCard extends StatelessWidget {
  final Map<String, dynamic> participant;

  const ParticipantCard({Key? key, required this.participant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
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

// Comments Section Component
class CommentsSection extends StatelessWidget {
  final List<Map<String, dynamic>> comments;

  const CommentsSection({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ...comments.map((comment) => CommentWidget(comment: comment)).toList(),
      ],
    );
  }
}

// Single Comment Widget
class CommentWidget extends StatelessWidget {
  final Map<String, dynamic> comment;

  const CommentWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 16), // Increased top padding for more space
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Profile Picture and Name with Time Ago
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[300],
                backgroundImage: comment['profileImage'] != null
                    ? AssetImage(comment['profileImage'])
                    : null,
                child: comment['profileImage'] == null
                    ? const Icon(Icons.person, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 12),
              // Name and Time Ago Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '3d',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Comment Text
          Text(
            comment['text'],
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          // Likes Row
          Row(
            children: [
              Icon(Icons.thumb_up_outlined, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                comment['likes'].toString(),
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Add Comment Section Component
class AddCommentSection extends StatelessWidget {
  const AddCommentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Add padding around the Row for better spacing
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), // Fully rounded corners
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Add a comment',
                border: InputBorder.none,
              ),
            ),
          ),
          // Send IconButton
          IconButton(
            icon: const Icon(Icons.send_outlined),
            color: Colors.white,
            onPressed: () {
              // Implement send functionality here
              // For example, you might want to capture the text and clear the field
            },
          ),
        ],
      ),
    );
  }
}
