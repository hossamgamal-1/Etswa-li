import 'package:e_commerce/ui/components/core/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';

import '../../core/themes/app_light_theme.dart';
import '../../data/database/products_data_services.dart';
import '../../modules/favourites/ui/favourites.dart';
import '../../ui/controllers/home_page_controller.dart';
import '../components/home page/home_page_strings.dart';
import '../components/core/product_tile.dart';
import '../components/home page/app_bar.dart';
import '../components/home page/categories_chip.dart';
import '../components/home page/categories_tiles.dart';
import '../components/home page/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List pages = [const HomeContent(), const Favourites(), cart(), profile()];
    HomePageController watch = context.watch<HomePageController>();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomePageAppBar(),
      ), //
      body: pages[watch.bottomNavigatorIndex],
      drawer: const Drawer(),
      bottomNavigationBar: const NavBar(),
    );
  }

  Widget cart() => const Center(child: Text(HomePageStrings.navBarCart));
  Widget profile() => const Center(child: Text(HomePageStrings.navBarProfile));
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      initFunction: () async {
        await FlutterStatusbarcolor.setNavigationBarColor(
            AppLightTheme.canvasColor);
        await FlutterStatusbarcolor.setStatusBarColor(
            AppLightTheme.canvasColor);
      },
      child: ListView(
        children: [
          SizedBox(height: 8.h, child: const CategoryChip()),
          SizedBox(
            height: 46.h,
            child: ProductTile(
              products: HomePageStrings.productTileProducts,
              seeAll: HomePageStrings.productTileSeeAll,
              productsData: ProductsDataGetter.products,
            ),
          ),
          const CategoriesTiles()
        ],
      ),
    );
  }
}
