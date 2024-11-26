import 'dart:ui'; // Required for ImageFilter
import 'package:flutter/material.dart';
import '../../components/event_header.dart';
import '../../components/event_details.dart';
import '../../components/participants_section.dart';
import '../../components/comments_section.dart';
import '../../components/add_comment_section.dart';

class FeedDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const FeedDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Optionally, you can set a background color or image here
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
                                creatorName: 'John Doe',
                              ),
                              const SizedBox(height: 16),
                              ParticipantsSection(
                                participants: item['participants'],
                                eventPassed: true,
                              ),
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
