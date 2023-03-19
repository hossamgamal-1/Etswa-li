import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../../data/model/product.dart';

class PriceTile extends StatelessWidget {
  const PriceTile(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 0.5.w),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('${product.price}\$',
                style: getRegularTextStyle(
                    color: ColorManager.offerPriceColor,
                    fontSize: FontSize.s4_8.sp)),
            Text(
              '${product.fakePrice.ceilToDouble() - 0.01}\$',
              style: getRegularTextStyle(
                      color: ColorManager.unSelectedIconColor,
                      fontSize: FontSize.s3.sp)
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
      ),
    );
  }
}
