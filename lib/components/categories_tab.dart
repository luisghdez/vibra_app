// lib/components/categories_tab.dart
import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import 'category_detail.dart';
import 'category_item.dart'; // Import the new component

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({Key? key}) : super(key: key);

  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  String? selectedCategory; // Holds the currently selected child category

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300), // Animation duration
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: selectedCategory == null
          ? _buildCategoriesList()
          : CategoryDetail(
              category: selectedCategory!,
              onBack: () {
                setState(() {
                  selectedCategory = null;
                });
              },
            ),
    );
  }

  // Widget to display the list of categories and their child categories
  Widget _buildCategoriesList() {
    return ListView.builder(
      key: const ValueKey('categoriesList'), // Unique key for AnimatedSwitcher
      padding: const EdgeInsets.only(
        top: 140.0, // Adjusted padding
        left: 16.0,
        right: 16.0,
        bottom: 140.0,
      ),
      itemCount: categories.keys.length,
      itemBuilder: (context, index) {
        String category = categories.keys.elementAt(index);
        List<Map<String, String>> childCategories = categories[category]!;

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
              const SizedBox(height: 8.0),
              // Horizontal list of child categories
              SizedBox(
                height: 250.0, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: childCategories.length,
                  itemBuilder: (context, childIndex) {
                    String childCategory = childCategories[childIndex]['name']!;
                    String imagePath = childCategories[childIndex]['image']!;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CategoryItem(
                        imagePath: imagePath,
                        categoryName: childCategory,
                        onTap: () {
                          setState(() {
                            selectedCategory =
                                childCategory; // Set selected category
                          });
                        },
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
}
