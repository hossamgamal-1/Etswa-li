import 'package:e_commerce/ui/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'favourites.dart';
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
    List pages = [const HomeContent(), const Favourites(), search(), profile()];
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

  Widget search() => const Center(child: Text('search'));

  Widget profile() => const Center(child: Text('profile'));
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        height: kToolbarHeight - 10,
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          cursorColor: Colors.blueAccent,
          decoration: InputDecoration(
            hintText: 'What are you looking for?',
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.grey,
          ),
          onChanged: context.watch<SearchController>().search,
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child: const Scaffold(), //Search
                type: PageTransitionType.bottomToTop,
              ),
            );
          },
        ),
      ),
    );
  }
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

/* class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: HomePageAppBar(),
        ),
        body: Consumer<SearchController>(
          builder: (context, value, child) => GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 2,
              childAspectRatio: 50.w / 40.h,
            ),
            itemBuilder: (context, index) => ProductCard(
              products: [],
              //context.read<SearchController>().search(searchBarValue),
              index: index,
            ),
          ),
        ));
  }
}
 */