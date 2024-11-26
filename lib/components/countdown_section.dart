import 'package:flutter/material.dart';

class CountdownSection extends StatelessWidget {
  final Duration duration;

  const CountdownSection({Key? key, required this.duration}) : super(key: key);

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String days = duration.inDays > 0 ? '${duration.inDays}d ' : '';
    String hours = twoDigits(duration.inHours.remainder(24));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$days$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Event Starts In:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          _formatDuration(duration),
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ],
    );
  }
}
