import 'package:flutter/material.dart';

class CountdownSection extends StatelessWidget {
  final Duration duration;

  const CountdownSection({Key? key, required this.duration}) : super(key: key);

  List<String> _getTimeComponents(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String days = duration.inDays.toString();
    String hours = twoDigits(duration.inHours.remainder(24));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return [days, hours, minutes, seconds];
  }

  @override
  Widget build(BuildContext context) {
    final timeComponents = _getTimeComponents(duration);
    final labels = ['Days', 'Hours', 'Minutes', 'Seconds'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            for (int index = 0; index < 4; index++) ...[
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        timeComponents[index],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      labels[index],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              if (index < 3)
                const SizedBox(
                    width:
                        12), // Add 10px space between containers except after the last one
            ],
          ],
        ),
        // ),
      ],
    );
  }
}
