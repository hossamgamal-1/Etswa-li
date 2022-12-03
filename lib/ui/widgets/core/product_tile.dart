import 'package:e_commerce/core/injection.dart';
import 'package:e_commerce/ui/widgets/core/list_staggered_animation.dart';
import 'package:e_commerce/ui/widgets/core/snapshot_error_waiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/app_text_styles.dart';
import '../../../data/database/remote_database.dart';
import '../../../ui/widgets/core/product_card.dart';
import '../../../ui/screens/see_all_page.dart';
import '../../../data/entities/products.dart';

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

    final ScrollController controller = ScrollController();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        remoteDatabase.getProductsData();
      }
    });

    return FutureBuilder(
      future: remoteDatabase.getProductsData(),
      builder: (context, snapShots) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 10),
              Text(products, style: AppTextStyles().mainTitle),
              Expanded(child: Container()),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(PageTransition(
                    duration: const Duration(milliseconds: 300),
                    child: SeeAllPage(title: products, data: productsData),
                    type: PageTransitionType.bottomToTop,
                  ));
                },
                child: Text(
                  seeAll,
                  style: AppTextStyles()
                      .productTitle
                      .copyWith(color: Colors.black),
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
                  controller: controller,
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
          )
        ],
      ),
    );
  }
}
