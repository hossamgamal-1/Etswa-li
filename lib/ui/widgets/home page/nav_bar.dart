import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../controllers/home_page_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController read = context.read<HomePageController>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(20),
      child: GNav(
        color: Colors.black,
        activeColor: Colors.white,
        tabBorderRadius: 15,
        iconSize: 24,
        tabBackgroundGradient: LinearGradient(colors: [
          for (int i = 0; i <= 3; i++) Colors.blueAccent,
          Colors.blueAccent.withOpacity(0.1),
        ]),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        onTabChange: read.bottomNavigatorIndexSetter,
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.favorite, text: 'Likes'),
          GButton(icon: Icons.search, text: 'Search'),
          GButton(icon: Icons.person, text: 'Profile')
        ],
      ),
    );
  }
}
