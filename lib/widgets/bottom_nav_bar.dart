import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';
import '../utils/constants.dart';
import '../screens/add_event/add_event_screen.dart';
import '../screens/add_post/add_post_screen.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  void _showAddOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.event),
                title: const Text('Add Event'),
                onTap: () {
                  Navigator.of(ctx).pop(); // Close the modal
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddEventScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.post_add),
                title: const Text('Add Post'),
                onTap: () {
                  Navigator.of(ctx).pop(); // Close the modal
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddPostScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Maps the provider's currentIndex to the BottomNavigationBar's index.
  int _mapProviderIndexToBottomNav(int providerIndex) {
    if (providerIndex <= 1) {
      return providerIndex;
    } else {
      // For indices after the 'Add' button, increment by 1
      return providerIndex + 1;
    }
  }

  /// Maps the BottomNavigationBar's index to the provider's currentIndex.
  int? _mapBottomNavToProviderIndex(int bottomNavIndex) {
    if (bottomNavIndex <= 1) {
      return bottomNavIndex;
    } else if (bottomNavIndex == 2) {
      // 'Add' button does not map to a provider index
      return null;
    } else {
      // For indices after the 'Add' button, decrement by 1
      return bottomNavIndex - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    int currentIndex =
        _mapProviderIndexToBottomNav(navigationProvider.currentIndex);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SafeArea(
        bottom: true, // Keep bottom SafeArea if needed
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 10.0, sigmaY: 10.0), // Adjust blur intensity
            child: Container(
              // Optionally remove fixed height or adjust as needed
              height: 62,
              color: Colors.black.withOpacity(0.55),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedFontSize: 0, // Set selected font size to zero
                unselectedFontSize: 0, // Set unselected font size to zero
                iconSize: 24, // Adjust icon size as needed
                backgroundColor:
                    Colors.transparent, // Make BottomNavigationBar transparent
                elevation: 0, // Remove shadow
                currentIndex: currentIndex,
                onTap: (index) {
                  if (index == 2) {
                    // 'Add' button tapped
                    _showAddOptions(context);
                  } else {
                    final newIndex = _mapBottomNavToProviderIndex(index);
                    if (newIndex != null) {
                      navigationProvider.updateIndex(newIndex);
                    }
                  }
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 30),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search, size: 30),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add, size: 36),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message_rounded, size: 28),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 30),
                    label: '',
                  ),
                ],
                selectedItemColor: Colors.white,
                unselectedItemColor: Color.fromARGB(255, 124, 124, 124),
                type: BottomNavigationBarType.fixed,
                enableFeedback: false, // Disable the regular tap animation
              ),
            ),
          ),
        ),
      ),
    );
  }
}
