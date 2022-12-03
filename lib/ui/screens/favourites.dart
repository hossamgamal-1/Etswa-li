import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../ui/controllers/home_page_controller.dart';
import '../../ui/widgets/core/product_card.dart';
import '../../data/database/products_data_services.dart';
import '../../data/entities/products.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageController>(
      builder: (context, value, child) => value.favouriteItemsIds.isEmpty
          ? Center(
              child: Text('You have no favorite items yet.',
                  style: TextStyle(fontSize: 6.sp),
                  textAlign: TextAlign.center))
          : AnimationLimiter(
              child: GridView.builder(
                itemCount: value.favouriteItemsIds.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 50.w / 40.h,
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  List<Product> getProductsFromFavIdsList = value
                      .favouriteItemsIds
                      .map((id) => ProductsDataGetter.products
                          .firstWhere((product) => id == product.id))
                      .toList();
                  return AnimationConfiguration.staggeredGrid(
                    columnCount: getProductsFromFavIdsList.length ~/ 2,
                    position: 0,
                    child: SlideAnimation(
                      horizontalOffset: 10,
                      verticalOffset: 10,
                      duration: const Duration(milliseconds: 300),
                      child: FadeInAnimation(
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: ProductCard(
                            index: index,
                            products: getProductsFromFavIdsList,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
