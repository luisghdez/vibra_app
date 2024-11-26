// lib/components/friends_tab.dart
import 'package:flutter/material.dart';
import '../models/for_you_item.dart';
import '../components/event_card.dart';
import '../data/mock_data.dart';

class FriendsTab extends StatelessWidget {
  const FriendsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Assuming friendsItems is similar to forYouItems. Adjust as necessary.
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 130.0, // Adjusted padding to account for AppBar and TabBar
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      itemCount:
          forYouItems.length, // Replace with friendsItems.length if different
      itemBuilder: (context, index) {
        return EventCard(
            item: forYouItems[
                index]); // Replace with friendsItems[index] if different
      },
    );
  }
}
