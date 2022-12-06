import 'package:flutter/material.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../data/entities/products.dart';
import '../../../core/themes/app_light_theme.dart';

class RatingPriceBar extends StatelessWidget {
  const RatingPriceBar(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            //TODO: rating package implementation
            Text(
              'RAAAAAAAAATE',
              style: TextStyle(fontSize: 14, color: AppLightTheme.canvasColor),
            ),
            SizedBox(width: 5),
          ],
        ),
        Text(
          '${product.price}\$',
          style: AppTextStyles.productPageDiscribtionTextStyle,
        ),
      ],
    );
  }
}
