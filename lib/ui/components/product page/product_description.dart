import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/product_details.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import 'product_page_strings.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    double pageHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight);
    return SizedBox(
      height: 0.2 * pageHeight,
      child: RichText(
        text: TextSpan(
          text: ProductPageStrings.about,
          style: getRegularTextStyle(
              color: ColorManager.black, fontSize: FontSize.s6_2.sp),
          children: [
            TextSpan(
              text: '\n${product.description}',
              style: getRegularTextStyle(
                  color: ColorManager.black, fontSize: FontSize.s4_8.sp),
            ),
          ],
        ),
      ),
    );
  }
}
