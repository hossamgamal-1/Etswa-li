import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/app_text_styles.dart';
import '../../../data/entities/products.dart';
import '../../../modules/cart/controllers/cart_controller.dart';
import 'product_page_strings.dart';

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
          onPressed: () {
            late SnackBar snackBar;
            if (product.quantity > 0) {
              if (!CartController.cartProductsIds.contains(product.id)) {
                read.addToCart(product.id);
                snackBar = SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text('${product.title} is Added to your Cart.'));
              } else {
                snackBar = SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text('${product.title} is Already in your Cart.'));
              }
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
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
