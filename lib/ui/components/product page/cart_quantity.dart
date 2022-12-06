import 'package:flutter/material.dart';

import '../../../core/themes/app_text_styles.dart';
import '../../../core/themes/app_light_theme.dart';
import 'product_page_strings.dart';

class CartQuantity extends StatelessWidget {
  const CartQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ProductPageStrings.quantity,
          style: AppTextStyles.productPageDiscribtionTextStyle,
        ),
        Row(
          children: [
            //TODO: add remove quantity logic
            const Icon(
              Icons.add,
              color: AppLightTheme.canvasColor,
              size: 24,
            ),
            const SizedBox(width: 2),
            Text(
              '0',
              style: AppTextStyles.productPageDiscribtionTextStyle,
            ),
            const SizedBox(width: 2),
            const Icon(
              Icons.remove,
              color: AppLightTheme.canvasColor,
              size: 24,
            ),
          ],
        ),
      ],
    );
  }
}
