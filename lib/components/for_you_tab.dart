import 'package:flutter/material.dart';
import '../models/for_you_item.dart';
import '../components/event_card.dart';
import '../data/mock_data.dart';

class ForYouTab extends StatelessWidget {
  const ForYouTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter future events
    List<ForYouItem> futureEvents =
        forYouItems.where((item) => !item.isPastEvent).toList();

    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 130.0, // Adjusted padding to account for AppBar and TabBar
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      itemCount: futureEvents.length,
      itemBuilder: (context, index) {
        return EventCard(item: futureEvents[index]);
      },
    );
  }
}
