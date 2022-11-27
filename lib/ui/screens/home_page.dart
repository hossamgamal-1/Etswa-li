import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/database/remote_database.dart';
import '../../ui/controllers/home_page_controller.dart';
import '../widgets/core/product_tile.dart';
import '../widgets/home page/categories_chip.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List pages = [const HomeContent(), favourite(), search(), profile()];
    HomePageController watch = context.watch<HomePageController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Hi, (name)')),
      body: pages[watch.bottomNavigatorIndex],
      drawer: const Drawer(),
      bottomNavigationBar: const NavBar(),
    );
  }

  Widget favourite() => const Center(child: Text('favourite'));

  Widget search() => const Center(child: Text('search'));

  Widget profile() => const Center(child: Text('profile'));
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //CategoryChip
          SizedBox(
            height: 8.h,
            child: const CategoryChip(),
          ),
          //ProductTile
          SizedBox(
            height: 51.h,
            child: ProductTile(
              products: 'Products',
              seeAll: 'see all',
              productsData: RemoteDatabase.products,
            ),
          ),
          const CategoriesTiles()
        ],
      ),
    );
  }
}

class CategoriesTiles extends StatelessWidget {
  const CategoriesTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int index = 0; index < RemoteDatabase.categories.length; index++)
          SizedBox(
            height: 51.h,
            child: ProductTile(
              products: RemoteDatabase.categories[index],
              seeAll: 'See All',
              productsData: RemoteDatabase.products
                  .where((product) =>
                      product.category == RemoteDatabase.categories[index])
                  .toList(),
            ),
          ),
      ],
    );
  }
}

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
