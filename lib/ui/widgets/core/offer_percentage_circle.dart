import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/entities/products.dart';

class OfferPercentageCircle extends StatelessWidget {
  const OfferPercentageCircle(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -2,
      left: -1,
      child: Container(
        width: 13.w,
        height: 13.w,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              '${(((product.fakePrice - product.price) / product.fakePrice) * 100).toInt()}% OFF!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
