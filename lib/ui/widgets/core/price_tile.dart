import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_text_styles.dart';
import '../../../data/entities/products.dart';

class PriceTile extends StatelessWidget {
  const PriceTile(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 0.5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            '${product.price}\$',
            style: AppTextStyles().productTitle.copyWith(
                  fontSize: 24,
                  color: Colors.red,
                ),
          ),
          Text(
            '${product.fakePrice.ceilToDouble() - 0.01}\$',
            style: AppTextStyles().productTitle.copyWith(
                  fontSize: 14,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
          ),
        ],
      ),
    );
  }
}
