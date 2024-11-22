// lib/screens/search/search_screen.dart

import 'package:flutter/material.dart';
import 'components/search_bar.dart' as custom;

// Sample data for demonstration
final List<String> forYouItems =
    List.generate(20, (index) => 'For You Item ${index + 1}');
final List<String> friendsItems =
    List.generate(20, (index) => 'Friend Item ${index + 1}');
final Map<String, List<String>> categories = {
  'Outdoors': ['Running Clubs', 'Hiking', 'Cycling', 'Camping'],
  'Technology': ['AI', 'Blockchain', 'Mobile Development', 'Cybersecurity'],
  'Arts': ['Painting', 'Sculpture', 'Photography', 'Dance'],
  // Add more categories and child categories as needed
};

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  // Widget for "For You" tab
  Widget _buildForYouTab() {
    return ListView.builder(
      padding:
          const EdgeInsets.only(top: kToolbarHeight + 48.0), // Adjust padding
      itemCount: forYouItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(forYouItems[index]),
        );
      },
    );
  }

  // Widget for "Friends" tab
  Widget _buildFriendsTab() {
    return ListView.builder(
      padding:
          const EdgeInsets.only(top: kToolbarHeight + 48.0), // Adjust padding
      itemCount: friendsItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(friendsItems[index]),
        );
      },
    );
  }

  // Widget for "Categories" tab
  Widget _buildCategoriesTab(BuildContext context) {
    return ListView.builder(
      padding:
          const EdgeInsets.only(top: kToolbarHeight + 48.0), // Adjust padding
      itemCount: categories.keys.length,
      itemBuilder: (context, index) {
        String category = categories.keys.elementAt(index);
        List<String> childCategories = categories[category]!;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Ensure visibility against background
                  ),
                ),
              ),
              SizedBox(
                height: 100.0, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: childCategories.length,
                  itemBuilder: (context, childIndex) {
                    String childCategory = childCategories[childIndex];
                    return GestureDetector(
                      onTap: () {
                        // Handle category tap if needed
                        // For now, we'll just print the selected category
                        print('Selected: $childCategory');
                      },
                      child: Container(
                        width: 150.0, // Adjust width as needed
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent
                              .withOpacity(0.7), // Semi-transparent
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            childCategory,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Main layout of the Search Screen with TabController
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        extendBodyBehindAppBar: true, // Extend body behind AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Make AppBar transparent
          elevation: 0, // Remove AppBar shadow
          title: TabBar(
            labelColor: Colors.white, // Ensure visibility against background
            unselectedLabelColor: Colors.grey[300],
            indicatorColor: Colors.white,
            tabs: const [
              Tab(text: 'For You'),
              Tab(text: 'Friends'),
              Tab(text: 'Categories'),
            ],
          ),
          // Optionally, add a bottom property for additional widgets like a search bar
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                _buildForYouTab(),
                _buildFriendsTab(),
                Builder(
                  builder: (context) => _buildCategoriesTab(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
