import 'package:flutter/material.dart';

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
