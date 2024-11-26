import 'package:flutter/material.dart';
import 'comment_widget.dart';

class CommentsSection extends StatelessWidget {
  final List<Map<String, dynamic>> comments;

  const CommentsSection({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ...comments.map((comment) => CommentWidget(comment: comment)).toList(),
      ],
    );
  }
}
