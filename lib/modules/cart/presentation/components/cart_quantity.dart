import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/resources/fonts_manager.dart';
import '../../../../data/model/product_model.dart';
import '../../business_logic/cart_controller.dart';

class CartQuantity extends StatelessWidget {
  const CartQuantity(
      {super.key, required this.product, required this.foregroundColor});
  final ProductModel product;
  final Color foregroundColor;
  @override
  Widget build(BuildContext context) {
    var read = context.read<CartController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        addRemoveIconTile(
          icon: Icons.remove,
          onPressed: () => read.removeQuantity(product),
          foregroundColor: foregroundColor,
        ),
        Consumer<CartController>(
          builder: (BuildContext context, value, Widget? child) => Text(
            NumberFormat('00').format(product.quantity),
            style: getRegularTextStyle(color: foregroundColor),
          ),
        ),
        addRemoveIconTile(
          icon: Icons.add,
          onPressed: () => read.addQuantity(product),
          foregroundColor: foregroundColor,
        ),
      ],
    );
  }

  Widget addRemoveIconTile(
      {required Color foregroundColor,
      required IconData icon,
      required Function() onPressed}) {
    return SizedBox(
      width: 10.w,
      height: 10.w,
      child: HoldDetector(
        onHold: () => onPressed(),
        holdTimeout: const Duration(milliseconds: 300),
        child: IconButton(
          icon: Icon(
            icon,
            color: foregroundColor,
            size: 5.w,
          ),
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}
