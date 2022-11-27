import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/app_text_styles.dart';
import '../../../ui/widgets/core/product_card.dart';
import '../../../ui/screens/see_all_page.dart';
import '../../../data/entities/products.dart';

/* class ScreenStrings {
  static const String products = 'Products';
  static const String seeAll = 'see all';
} */

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.products,
    required this.seeAll,
    required this.productsData,
  });
  final String products;
  final String seeAll;
  final List<Product> productsData;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                style:
                    AppTextStyles().productTitle.copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        SizedBox(
          height: 80.w,
          child: ListView.builder(
            itemCount: productsData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                ProductCard(products: productsData, index: index),
          ),
        ),
      ],
    );
  }
}
