import 'package:flutter/material.dart';
import 'participant_card.dart';

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
          height: 300, // Adjusted height for vertical cards
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
