import 'package:flutter/material.dart';
import 'dart:ui';
import '../../components/custom_tab_indicator.dart';
import '../../components/for_you_tab.dart';
import '../../components/friends_tab.dart';
import '../../components/categories_tab.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // You can add additional state variables here if needed

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: 58.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.55),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey[300],
                      indicator: CustomTabIndicator(
                        color: Colors.white.withOpacity(0.9),
                        radius: 30.0,
                        horizontalPadding: 0.0,
                      ),
                      dividerColor: Colors.transparent,
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
        body: const Stack(
          children: [
            TabBarView(
              children: [
                ForYouTab(),
                FriendsTab(),
                CategoriesTab(), // Use the new CategoriesTab widget
              ],
            ),
          ],
        ),
      ),
    );
  }
}
