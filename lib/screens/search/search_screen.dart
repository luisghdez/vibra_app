import 'package:flutter/material.dart';
import 'package:vibra_app/models/for_you_item.dart';
import 'dart:ui';
import 'components/search_bar.dart' as custom;

// Sample data for demonstration
final List<ForYouItem> forYouItems = List.generate(
  20,
  (index) => ForYouItem(
    imageUrl: 'assets/feed.png', // Path to your asset image
    title: 'New Year Celebration ${index + 1}',
    creator: 'User ${index + 1}',
    friendsCount: 4 + index, // Example friends count
    date: 'Thu, Dec 28',
    time: '2:00 PM',
    location: 'The Bar ${index + 1}',
  ),
);
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
    final double indicatorHeight = tabHeight * 0.65; // Adjust as needed

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

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // You can add additional state variables here if needed

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
                    height: 58.0, // Height of the TabBar
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.55), // Semi-transparent background
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                    ),
                    child: TabBar(
                      labelColor: Colors.black, // Active tab label color
                      unselectedLabelColor: Colors.grey[300],
                      indicator: CustomTabIndicator(
                        color: Colors.white
                            .withOpacity(0.9), // Indicator color with opacity
                        radius: 30.0, // Rounded corners
                        horizontalPadding:
                            0.0, // Extend indicator by 10.0 on each side
                      ),
                      dividerColor: Colors.transparent, // Hide tab divider
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
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
                CategoriesTab(), // Use the new CategoriesTab widget
              ],
            ),
          ],
        ),
      ),
    );
  }

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
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.grey[900], // Added background color for visibility
          child: Row(
            children: [
              // Left-side image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  forYouItems[index].imageUrl,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0), // Spacing between image and text
              // Right-side text content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        forYouItems[index].title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${forYouItems[index].creator} and ${forYouItems[index].friendsCount} friends',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        '${forYouItems[index].date}, ${forYouItems[index].time}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        forYouItems[index].location,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget for "Friends" tab
  Widget _buildFriendsTab() {
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
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.grey[900], // Added background color for visibility
          child: Row(
            children: [
              // Left-side image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  forYouItems[index].imageUrl,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0), // Spacing between image and text
              // Right-side text content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        forYouItems[index].title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${forYouItems[index].creator} and ${forYouItems[index].friendsCount} friends',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        '${forYouItems[index].date}, ${forYouItems[index].time}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        forYouItems[index].location,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Assuming categories and forYouItems are defined as in your previous code

class CategoriesTab extends StatefulWidget {
  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  String? selectedCategory; // Holds the currently selected child category

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300), // Duration of the animation
      transitionBuilder: (Widget child, Animation<double> animation) {
        // You can customize the transition here
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: selectedCategory == null
          ? _buildCategoriesList()
          : _buildCategoryDetail(selectedCategory!),
    );
  }

  // Widget to display the list of categories and their child categories
  Widget _buildCategoriesList() {
    return ListView.builder(
      key: const ValueKey('categoriesList'), // Unique key for AnimatedSwitcher
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
                        setState(() {
                          selectedCategory =
                              childCategory; // Set selected category
                        });
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

  // Widget to display items for the selected category
  Widget _buildCategoryDetail(String category) {
    // For demonstration, we'll use the same forYouItems list.
    // Ideally, you should filter or fetch items based on the category.
    return Column(
      key: ValueKey(
          'categoryDetail_$category'), // Unique key for AnimatedSwitcher
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with Back Button and Category Title
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 140),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  setState(() {
                    selectedCategory = null; // Go back to categories list
                  });
                },
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  '$category',
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Divider
        Divider(
          color: Colors.grey[700],
          thickness: 1.0,
        ),
        // List of Items for the Selected Category
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            itemCount: forYouItems
                .length, // You can change this to category-specific count
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                color:
                    Colors.grey[900], // Added background color for visibility
                child: Row(
                  children: [
                    // Left-side image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        forYouItems[index].imageUrl,
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                        width: 16.0), // Spacing between image and text
                    // Right-side text content
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0), // Add padding
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              forYouItems[index].title,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${forYouItems[index].creator} and ${forYouItems[index].friendsCount} friends',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              '${forYouItems[index].date}, ${forYouItems[index].time}',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              forYouItems[index].location,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
