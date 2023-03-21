import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../business_logic/home_page_controller.dart';
import 'home_page_strings.dart';

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
        color: ColorManager.black,
        activeColor: ColorManager.white,
        tabBorderRadius: 15,
        iconSize: 24,
        tabBackgroundGradient: LinearGradient(colors: [
          for (int i = 0; i <= 3; i++) ColorManager.primaryColor,
          ColorManager.primaryColor.withOpacity(0.1),
        ]),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        onTabChange: read.bottomNavigatorIndexSetter,
        tabs: const [
          GButton(icon: Icons.home, text: HomePageStrings.navBarHome),
          GButton(icon: Icons.favorite, text: HomePageStrings.navBarFavorites),
          GButton(icon: Icons.shopping_cart, text: HomePageStrings.navBarCart),
          GButton(icon: Icons.person, text: HomePageStrings.navBarProfile)
        ],
      ),
    );
  }
}
