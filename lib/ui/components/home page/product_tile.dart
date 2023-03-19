import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';

import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../core/product_card.dart';
import '../../screens/see_all_page.dart';
import '../../../data/model/product.dart';
import '../core/list_staggered_animation.dart';

class ProductTile extends StatelessWidget {
  final String products;
  final String seeAll;
  final List<Product> productsData;

  const ProductTile(
      {super.key,
      required this.products,
      required this.seeAll,
      required this.productsData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 10),
            Text(
              products,
              style: getRegularTextStyle(
                  color: ColorManager.black, fontSize: FontSize.s4.sp),
            ),
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
                style: getRegularTextStyle(color: ColorManager.black),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        SizedBox(
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
      ],
    );
  }
}
