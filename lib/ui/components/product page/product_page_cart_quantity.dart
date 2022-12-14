import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/app_text_styles.dart';
import '../../../modules/cart/controllers/cart_controller.dart';
import '../core/favourite_button.dart';
import '../../../data/entities/products.dart';

class ProductPageCartQuantity extends StatelessWidget {
  const ProductPageCartQuantity(this.product, {super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    var read = context.read<CartController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              addRemoveIconTile(
                icon: Icons.remove,
                onPressed: () => read.removeQuantity(product),
              ),
              Consumer<CartController>(
                builder: (BuildContext context, value, Widget? child) => Text(
                  NumberFormat('00').format(product.quantity),
                  style: AppTextStyles.productPageDiscribtionTextStyle,
                ),
              ),
              addRemoveIconTile(
                icon: Icons.add,
                onPressed: () => read.addQuantity(product),
              ),
            ],
          ),
          FavouriteButton(product)
        ],
      ),
    );
  }

  Container addRemoveIconTile(
      {required IconData icon, required Function() onPressed}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
      child: HoldDetector(
        onHold: () => onPressed(),
        holdTimeout: const Duration(milliseconds: 300),
        child: IconButton(
          icon: Icon(
            icon,
            color: const Color.fromARGB(255, 61, 61, 61),
            size: 6.w,
          ),
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}
