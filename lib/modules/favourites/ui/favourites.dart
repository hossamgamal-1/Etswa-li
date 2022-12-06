import 'package:e_commerce/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../ui/components/core/product_card.dart';
import '../../../ui/components/core/grid_staggerd_animation.dart';
import '../../../data/database/products_data_services.dart';
import '../../../data/entities/products.dart';
import '../controllers/favourites_controller.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouritesController>(
      builder: (context, value, _) => FavouritesController
              .favouriteItemsIds.isEmpty
          ? Center(
              child: Text('You have no favorite items yet.',
                  style: AppTextStyles.categoryChipTextStyle,
                  textAlign: TextAlign.center))
          : AnimationLimiter(
              child: GridView.builder(
                itemCount: FavouritesController.favouriteItemsIds.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 50.w / 40.h,
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  List<Product> getProductsFromFavIdsList = FavouritesController
                      .favouriteItemsIds
                      .map((id) => ProductsDataGetter.products
                          .firstWhere((product) => id == product.id))
                      .toList();

                  return ProductsDataGetter.products.isEmpty
                      ? Container()
                      : GridStaggeredAnimation(
                          listLength: getProductsFromFavIdsList.length,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: ProductCard(
                              index: index,
                              products: getProductsFromFavIdsList,
                            ),
                          ),
                        );
                },
              ),
            ),
    );
  }
}
