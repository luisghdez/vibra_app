import 'package:flutter/material.dart';
import 'dart:ui';
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

// Custom Tab Indicator
class CustomTabIndicator extends Decoration {
  final Color color;
  final double radius;
  final double horizontalPadding;

  const CustomTabIndicator({
    required this.color,
    this.radius = 30.0,
    this.horizontalPadding = 10.0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(color, radius, horizontalPadding);
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  final Color color;
  final double radius;
  final double horizontalPadding;

  _CustomTabIndicatorPainter(this.color, this.radius, this.horizontalPadding);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    // Calculate the center of the tab
    final double tabWidth = cfg.size!.width;
    final double tabHeight = cfg.size!.height;

    // Define the dimensions of the indicator
    final double indicatorWidth = tabWidth + (2 * horizontalPadding);
    final double indicatorHeight = tabHeight; // Adjust as needed

    // Calculate the position to center the indicator vertically and extend horizontally
    final Offset indicatorOffset = Offset(
      offset.dx - horizontalPadding,
      (tabHeight - indicatorHeight) / 2,
    );

    final Rect rect = indicatorOffset & Size(indicatorWidth, indicatorHeight);
    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    // Draw the rounded rectangle
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rRect, paint);
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  // Widget for "For You" tab
  Widget _buildForYouTab() {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 120.0, // Adjusted padding to account for AppBar and TabBar
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      itemCount: forYouItems.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white.withOpacity(0.8), // Semi-transparent card
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(
              forYouItems[index],
              style: const TextStyle(
                  color: Colors.black), // Black text for readability
            ),
          ),
        );
      },
    );
  }

  // Widget for "Friends" tab
  Widget _buildFriendsTab() {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 120.0, // Adjusted padding
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      itemCount: friendsItems.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white.withOpacity(0.8),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(
              friendsItems[index],
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  // Widget for "Categories" tab
  Widget _buildCategoriesTab(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 120.0, // Adjusted padding
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      itemCount: categories.keys.length,
      itemBuilder: (context, index) {
        String category = categories.keys.elementAt(index);
        List<String> childCategories = categories[category]!;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text for visibility
                  ),
                ),
              ),
              // Horizontal list of child categories
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
                              .withOpacity(0.7), // Semi-transparent background
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
        extendBodyBehindAppBar: true, // Allow body to render behind AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Make AppBar transparent
          elevation: 0, // Remove AppBar shadow
          // Move TabBar to the bottom property with custom styling
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
                20.0), // Increased height for better visibility
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0), // Rounded corners
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 10.0, sigmaY: 10.0), // Apply blur effect
                  child: Container(
                    height: 54.0, // Height of the TabBar
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.2), // Semi-transparent background
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                      // border: Border.all(
                      //   color: Colors.white
                      //       .withOpacity(0.3), // Border color with opacity
                      //   width: 1.0, // Border width
                      // ),
                    ),
                    child: TabBar(
                      labelColor: Colors.white, // Active tab label color
                      unselectedLabelColor:
                          Colors.grey[300], // Inactive tab label color
                      indicator: CustomTabIndicator(
                        color: Colors.white
                            .withOpacity(0.3), // Indicator color with opacity
                        radius: 30.0, // Rounded corners
                        horizontalPadding:
                            0.0, // Extend indicator by 10.0 on each side
                      ),
                      dividerColor: Colors.transparent, // Hide tab divider
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(text: 'For You'),
                        Tab(text: 'Friends'),
                        Tab(text: 'Categories'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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
