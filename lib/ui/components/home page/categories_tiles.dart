import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'product_tile.dart';
import '../../../core/injection.dart';
import '../../../ui/components/core/snapshot_error_waiting.dart';
import '../../../ui/components/home%20page/home_page_strings.dart';
import '../../../data/database/category_data_services.dart';
import '../../../data/entities/categories.dart';
import '../../../data/database/products_data_services.dart';
import '../../../data/database/remote_database.dart';

class CategoriesTiles extends StatelessWidget {
  const CategoriesTiles({super.key});

  @override
  Widget build(BuildContext context) {
    RemoteDatabase remoteDatabase = RemoteDatabase(getIt(), getIt());

    return FutureBuilder(
      future: remoteDatabase.getProductsData(),
      builder: (context, snapShots) {
        return Column(
          children: [
            for (Category category in CategoryDataGetter.categories)
              SnapShotErrorWaitingHandler(
                snapShots: snapShots,
                child: ProductsDataGetter.products
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
              ),
          ],
        );
      },
    );
  }
}
