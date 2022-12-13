import 'package:e_commerce/data/entities/products.dart';
import 'package:e_commerce/modules/cart/controllers/cart_controller.dart';
import 'package:e_commerce/ui/components/product%20page/product_page_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/app_text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton(
      {super.key, required this.product, required this.backgroundColor});
  final Color backgroundColor;
  final Product product;
  @override
  Widget build(BuildContext context) {
    var read = context.read<CartController>();
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextButton(
          onPressed: () =>
              product.quantity > 0 ? read.addToCart(product.id) : null,
          child: Text(
            ProductPageStrings.addToCart,
            style: AppTextStyles.productPageButtonTextStyle.copyWith(
              color: useWhiteForeground(backgroundColor)
                  ? Colors.white
                  : Colors.black,
            ),
          )),
    );
  }
}
