class ForYouItem {
  final String title;
  final String creator;
  final int friendsCount;
  final String date;
  final String time;
  final String location;
  final String imageUrl;
  final DateTime eventDate; // To handle countdown
  final bool isPastEvent; // Indicates if the event is past or future
  final List<Map<String, dynamic>> participants;
  final List<Map<String, dynamic>> comments;

  ForYouItem({
    required this.title,
    required this.creator,
    required this.friendsCount,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
    required this.eventDate,
    required this.isPastEvent,
    required this.participants,
    required this.comments,
  });

  // Convert ForYouItem to Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'creator': creator,
      'friendsCount': friendsCount,
      'date': date,
      'time': time,
      'location': location,
      'imageUrl': imageUrl,
      'eventDate': eventDate,
      'isPastEvent': isPastEvent,
      'participants': participants, // Ensure List<Map<String, dynamic>>
      'comments': comments, // Ensure List<Map<String, dynamic>>
    };
  }
}
