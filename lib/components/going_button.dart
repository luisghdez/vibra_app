import 'package:flutter/material.dart';

class GoingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoingButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // color: Colors.blueAccent, // Button color
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
        ),
        child: const Text(
          "I'm Going",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
