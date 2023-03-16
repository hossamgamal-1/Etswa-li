import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/resources/app_text_styles.dart';
import '../../../core/resources/color_manager.dart';
import '../../../data/database/remote_database.dart';
import '../core/product_card.dart';
import '../../screens/see_all_page.dart';
import '../../../data/entities/products.dart';
import '../../../core/injection.dart';
import '../core/list_staggered_animation.dart';
import '../core/snapshot_error_waiting.dart';

class ProductTile extends StatelessWidget {
  final String products;
  final String seeAll;
  final List<Product> productsData;

  const ProductTile({
    super.key,
    required this.products,
    required this.seeAll,
    required this.productsData,
  });

  @override
  Widget build(BuildContext context) {
    RemoteDatabase remoteDatabase = RemoteDatabase(getIt(), getIt());

/*     final ScrollController controller = ScrollController();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        remoteDatabase.getProductsData();
      }
    });
 */
    return FutureBuilder(
      future: remoteDatabase.getProductsData(),
      builder: (context, snapShots) {
        //print('products = ${ProductsDataGetter.products}');
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 10),
                Text(products, style: AppTextStyles.mainTitle),
                Expanded(child: Container()),
                TextButton(
                  onPressed: () => Navigator.of(context).push(
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      type: PageTransitionType.bottomToTop,
                      child: SeeAllPage(
                        title: products,
                        productsData: productsData,
                      ),
                    ),
                  ),
                  child: Text(
                    seeAll,
                    style: AppTextStyles.productTitle
                        .copyWith(color: ColorManager.black),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            SnapShotErrorWaitingHandler(
              snapShots: snapShots,
              child: SizedBox(
                height: 40.h,
                child: AnimationLimiter(
                  child: ListView.builder(
                    itemCount: productsData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ListStaggeredAnimation(
                      child: ProductCard(
                        products: productsData,
                        index: index,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
