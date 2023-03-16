import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/app_text_styles.dart';
import '../../../ui/components/core/product_card.dart';
import '../../../ui/components/core/grid_staggerd_animation.dart';
import '../../../data/database/products_data_services.dart';
import '../../../data/entities/products.dart';
import '../controllers/favourites_controller.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> getProductsFromFavIdsList = [];

    for (int id in FavouritesController.favouriteItemsIds) {
      if (ProductsDataGetter.productsIds.contains(id)) {
        getProductsFromFavIdsList.add(ProductsDataGetter.products
            .firstWhere((product) => id == product.id));
      }
    }

    return Consumer<FavouritesController>(
      builder: (context, value, _) => getProductsFromFavIdsList.isEmpty
          ? Center(
              child: Text('You have no favorite items yet.',
                  style: AppTextStyles.mainTitle, textAlign: TextAlign.center))
          : AnimationLimiter(
              child: GridView.builder(
                itemCount: getProductsFromFavIdsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 50.w / 40.h,
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
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
