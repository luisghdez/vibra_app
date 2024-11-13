// lib/models/feed_item_model.dart
import 'package:flutter/material.dart';

class FeedItemModel {
  final String title;
  final IconData icon;
  final String username;
  final int friendsCount;
  final String caption;
  final String imagePath;
  final String avatarPath;

  const FeedItemModel({
    required this.title,
    required this.icon,
    required this.username,
    required this.friendsCount,
    required this.caption,
    required this.imagePath,
    required this.avatarPath,
  });
}
