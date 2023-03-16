import 'package:flutter/material.dart';

import '../../../core/resources/app_text_styles.dart';
import '../../../data/entities/products.dart';
import 'product_page_strings.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

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
          style: AppTextStyles.productPageTitleTextStyle,
          children: [
            TextSpan(
              text: '\n${product.description}',
              style: AppTextStyles.productPageDiscribtionTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
