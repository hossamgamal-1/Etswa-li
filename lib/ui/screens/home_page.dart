import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/favourites/ui/favourites.dart';
import '../widgets/home page/app_bar.dart';
import '../widgets/home page/nav_bar.dart';
import '../widgets/core/product_tile.dart';
import '../widgets/home page/categories_chip.dart';
import '../widgets/home page/categories_tiles.dart';
import '../../ui/controllers/home_page_controller.dart';
import '../../data/database/products_data_services.dart';

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

  Widget cart() => const Center(child: Text('cart'));
  Widget profile() => const Center(child: Text('profile'));
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 8.h, child: const CategoryChip()),
        ProductTile(
          products: 'Products',
          seeAll: 'see all',
          productsData: ProductsDataGetter.products,
        ),
        const CategoriesTiles()
      ],
    );
  }
}
