import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/home_header.dart';
import 'widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Main layout of the Home Screen
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0), // Add padding if needed
          child: Text(
            'Vibra',
            style: GoogleFonts.notable(
              fontSize: 36, // Large font size
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: false, // Aligns title to the left
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined),
            onPressed: () {
              // Define the action for the notifications icon here
              print('Notifications icon pressed');
            },
          ),
        ],
      ),
      body: const Column(
        children: [
          // HomeHeader(),
          Expanded(
            child: HomeWidget(),
          ),
        ],
      ),
    );
  }
}
