import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../core/list_staggered_animation.dart';
import 'product_tile.dart';
import '../../../ui/components/home%20page/home_page_strings.dart';
import '../../../data/database/category_data_services.dart';
import '../../../data/model/category.dart';
import '../../../data/database/products_data_services.dart';

class CategoriesTiles extends StatelessWidget {
  const CategoriesTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimationLimiter(
          child: ListStaggeredAnimation(
            child: SizedBox(
              height: 46.h,
              child: ProductTile(
                products: HomePageStrings.productTileProducts,
                seeAll: HomePageStrings.productTileSeeAll,
                productsData: ProductsDataGetter.products,
              ),
            ),
          ),
        ),
        for (Category category in CategoryDataGetter.categories)
          ProductsDataGetter.products
                  .where((product) =>
                      product.categoryName == category.categoryName)
                  .toList()
                  .isEmpty
              ? Container()
              : SizedBox(
                  height: 46.h,
                  child: ProductTile(
                    products: category.categoryName,
                    seeAll: HomePageStrings.productTileSeeAll,
                    productsData: ProductsDataGetter.products
                        .where((product) =>
                            product.categoryName == category.categoryName)
                        .toList(),
                  ),
                ),
      ],
    );
  }
}
