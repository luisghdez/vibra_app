// lib/components/for_you_tab.dart
import 'package:flutter/material.dart';
import '../models/for_you_item.dart';
import '../components/event_card.dart';
import '../data/mock_data.dart';

class ForYouTab extends StatelessWidget {
  const ForYouTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 120.0, // Adjusted padding to account for AppBar and TabBar
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      itemCount: forYouItems.length,
      itemBuilder: (context, index) {
        return EventCard(item: forYouItems[index]);
      },
    );
  }
}
