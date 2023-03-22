import 'package:e_commerce/domain/use_cases/use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/injection.dart';
import '../../modules/cart/presentation/cart.dart';
import '../../modules/favourites/presentation/favourites.dart';
import '../business_logic/home_page_controller.dart';
import '../components/core/snapshot_error_waiting.dart';
import '../components/home page/app_bar.dart';
import '../components/home page/categories_chip.dart';
import '../components/home page/categories_tiles.dart';
import '../components/home page/drawer.dart';
import '../components/home page/nav_bar.dart';
import 'profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const List pages = [HomeContent(), Favourites(), CartPage(), Profile()];
    HomePageController watch = context.watch<HomePageController>();

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: HomePageAppBar()),
      body: pages[watch.bottomNavigatorIndex],
      drawer: const HomePageDrawer(),
      bottomNavigationBar: const NavBar(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    UseCases useCases = UseCases(sL(), sL(), sL());
    return ListView(
      children: [
        SizedBox(
          height: 12.h,
          child: FutureBuilder(
            future: useCases.getCategoriesData(),
            builder: (context, snapShots) => SnapShotErrorWaitingHandler(
              snapShots: snapShots,
              child: const CategoriesChip(),
            ),
          ),
        ),
        FutureBuilder(
          future: useCases.getProductsData(),
          builder: (context, snapshots) => SnapShotErrorWaitingHandler(
            snapShots: snapshots,
            child: const CategoriesTiles(),
          ),
        ),
      ],
    );
  }
}
