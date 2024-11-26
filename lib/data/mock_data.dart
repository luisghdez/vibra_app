// lib/data/mock_data.dart
import '../models/for_you_item.dart';

import '../models/for_you_item.dart';

final List<ForYouItem> forYouItems = List.generate(
  10,
  (index) {
    DateTime eventDate = DateTime.now().add(Duration(days: index + 1));
    return ForYouItem(
      title: 'Future Event ${index + 1}',
      creator: 'Creator ${index + 1}',
      friendsCount: 5 + index,
      date: '${eventDate.day}/${eventDate.month}/${eventDate.year}',
      time: '${eventDate.hour}:${eventDate.minute.toString().padLeft(2, '0')}',
      location: 'Location ${index + 1}',
      imageUrl: 'assets/feed.png', // Ensure this asset exists
      eventDate: eventDate,
      isPastEvent: false, // All are future events
      participants: [
        {
          'name': 'Participant A',
          'age': 25,
          'hobbies': 'Reading, Hiking',
          'profileImage': 'assets/avatar7.png',
        },
        {
          'name': 'Participant B',
          'age': 30,
          'hobbies': 'Cooking, Gaming',
          'profileImage': null,
        },
        // Add more participants as needed
      ],
      comments: [
        {
          'name': 'Commenter A',
          'profileImage': 'assets/avatar7.png',
          'text': 'Looking forward to this event!',
          'likes': 5,
        },
        {
          'name': 'Commenter B',
          'profileImage': null,
          'text': 'Can\'t wait!',
          'likes': 3,
        },
        // Add more comments as needed
      ],
    );
  },
);

final List<String> friendsItems =
    List.generate(20, (index) => 'Friend Item ${index + 1}');

final Map<String, List<Map<String, String>>> categories = {
  'Illustrations': [
    {
      'name': 'Running Clubs',
      'image': 'assets/categories/runningpng.png',
    },
    {
      'name': 'Hiking',
      'image': 'assets/categories/hikingpng.png',
    },
    {
      'name': 'Fitness',
      'image': 'assets/categories/fitness.png',
    },
    // {
    //   'name': 'Camping',
    //   'image': 'assets/images/categories/camping.png',
    // },
    // Add more child categories with images as needed
  ],
  'Real / AI': [
    {
      'name': 'Running',
      'image': 'assets/categories/runningreal.png',
    },
    {
      'name': 'Hiking',
      'image': 'assets/categories/hikingai.png',
    },
    {
      'name': 'Fitness',
      'image': 'assets/categories/fitnessai.png',
    },
    // {
    //   'name': 'Theater',
    //   'image': 'assets/images/categories/theater.png',
    // },
    // Add more child categories with images as needed
  ],
  "Weekend AI?": [
    {
      'name': 'House Party',
      'image': 'assets/categories/6.png',
    },
    {
      'name': 'Clubbing',
      'image': 'assets/categories/5.png',
    },
    {
      'name': 'Concert',
      'image': 'assets/categories/4.png',
    },
    {
      'name': 'Dinner',
      'image': 'assets/categories/7.png',
    },
    // {
    // Add more child categories with images as needed
  ],
  // 'Technology': [
  //   {
  //     'name': 'AI',
  //     'image': 'assets/images/categories/ai.png',
  //   },
  //   {
  //     'name': 'Blockchain',
  //     'image': 'assets/images/categories/blockchain.png',
  //   },
  //   {
  //     'name': 'Mobile Development',
  //     'image': 'assets/images/categories/mobile_development.png',
  //   },
  //   {
  //     'name': 'Cybersecurity',
  //     'image': 'assets/images/categories/cybersecurity.png',
  //   },
  //   // Add more child categories with images as needed
  // ],
  // 'Arts': [
  //   {
  //     'name': 'Painting',
  //     'image': 'assets/images/categories/painting.png',
  //   },
  //   {
  //     'name': 'Sculpture',
  //     'image': 'assets/images/categories/sculpture.png',
  //   },
  //   {
  //     'name': 'Photography',
  //     'image': 'assets/images/categories/photography.png',
  //   },
  //   {
  //     'name': 'Dance',
  //     'image': 'assets/images/categories/dance.png',
  //   },
  //   // Add more child categories with images as needed
  // ],
  // // Add more categories and child categories with images as needed
};
