import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/app_text_styles.dart';
import '../../../ui/screens/product_page.dart';
import '../../../data/entities/products.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.products, required this.index, super.key});
  final List<Product> products;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          child: ProductPage(products[index]),
          duration: const Duration(milliseconds: 300),
          type: PageTransitionType.fade,
        ),
      ),
      child: Stack(children: [
        Column(
          children: [
            Container(
              constraints: BoxConstraints(minWidth: 28.w, maxWidth: 45.w),
              height: 28.h,
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
              child: CachedNetworkImage(
                imageUrl: products[index].imageUrl,
                progressIndicatorBuilder: (x, y, z) => const Center(
                    child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 204, 204, 204))),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: 31.w,
              height: 8.5.h,
              child: Center(
                child: Text(
                  products[index].title,
                  style: AppTextStyles().productTitle,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${products[index].price}\$',
                  style: AppTextStyles().productTitle.copyWith(
                        fontSize: 24,
                        color: Colors.red,
                      ),
                ),
                Text(
                  '${products[index].fakePrice.ceilToDouble() - 0.01}\$',
                  style: AppTextStyles().productTitle.copyWith(
                        fontSize: 16,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                '${(((products[index].fakePrice - products[index].price) / products[index].fakePrice) * 100).toInt()}% OFF!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
