import 'dart:async';
import 'dart:ui'; // Required for ImageFilter
import 'package:flutter/material.dart';
import '../../components/event_header.dart';
import '../../components/event_details.dart';
import '../../components/participants_section.dart';
import '../../components/comments_section.dart';
import '../../components/add_comment_section.dart';
import '../../components/countdown_section.dart';
import '../../components/going_button.dart';

class FutureEventDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const FutureEventDetailsScreen({Key? key, required this.item})
      : super(key: key);

  @override
  _FutureEventDetailsScreenState createState() =>
      _FutureEventDetailsScreenState();
}

class _FutureEventDetailsScreenState extends State<FutureEventDetailsScreen> {
  late Timer _timer;
  Duration _timeRemaining = Duration();

  @override
  void initState() {
    super.initState();
    _calculateTimeRemaining();
    _startCountdown();
  }

  void _calculateTimeRemaining() {
    DateTime eventDate =
        widget.item['eventDate']; // Ensure this is a DateTime object
    setState(() {
      _timeRemaining = eventDate.difference(DateTime.now());
      if (_timeRemaining.isNegative) {
        _timeRemaining = Duration.zero;
      }
    });
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_timeRemaining.inSeconds <= 0) {
        timer.cancel();
      } else {
        setState(() {
          _timeRemaining = _timeRemaining - const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _handleGoingButton() {
    // Implement the logic to handle the "I'm Going" action
    // For example, update the event's attendee list or notify the backend
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('You have indicated you are going to this event!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fixed EventHeader at the bottom layer
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: EventHeader(),
          ),

          // Scrollable content that overlays the EventHeader
          SingleChildScrollView(
            padding: EdgeInsets.zero, // No additional padding
            child: Column(
              children: [
                // Spacer to allow the EventHeader to be fully visible initially
                const SizedBox(height: 400),

                // Content with opacity, blur effect, and rounded corners
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
                              EventDetails(
                                title: widget.item['title'],
                                dateLocation:
                                    '${widget.item['date']} · ${widget.item['location']}',
                                creatorName: widget.item['creator'],
                              ),
                              const SizedBox(height: 16),
                              CountdownSection(duration: _timeRemaining),
                              const SizedBox(height: 16),
                              ParticipantsSection(
                                  participants: widget.item['participants'],
                                  eventPassed: false),
                              const SizedBox(height: 16),
                              CommentsSection(
                                  comments: widget.item['comments']),
                              const SizedBox(height: 16),
                              AddCommentSection(),
                              const SizedBox(height: 16),
                              GoingButton(onPressed: _handleGoingButton),
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
