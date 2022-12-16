import 'package:e_commerce/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../../core/themes/app_light_theme.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../data/entities/products.dart';
import '../../../../ui/components/core/price_tile.dart';
import '../../../../ui/screens/product_page.dart';
import 'cart_quantity.dart';

class CartProductTile extends StatelessWidget {
  const CartProductTile(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    var read = context.read<CartController>();
    var alertDialog = AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to remove this item?'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppLightTheme.offerPriceColor),
            )),
        TextButton(
            onPressed: () {
              read.removeFromCart(product.id);

              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(color: AppLightTheme.foregroundColor),
            )),
      ],
    );
    return InkWell(
      onLongPress: () =>
          showDialog(context: context, builder: (context) => alertDialog),
      child: ImagePixels(
        imageProvider: CachedNetworkImageProvider(product.imageUrls[0]),
        builder: (context, img) {
          Color backgroundColor = img.pixelColorAt!(0, 0);
          Color foregroundColor =
              useWhiteForeground(backgroundColor) ? Colors.white : Colors.black;
          return InkWell(
            onTap: () => Navigator.push(
              context,
              PageTransition(
                child: ProductPage(product),
                type: PageTransitionType.fade,
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
              height: 15.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    for (double i = 0; i <= 0.4; i = i + 0.2)
                      backgroundColor.withOpacity(1 - i)
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 2),
                  Container(
                    width: 32.w,
                    height: 13.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image:
                              CachedNetworkImageProvider(product.imageUrls[0]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        product.title,
                        style: AppTextStyles.categoryChipTextStyle
                            .copyWith(color: foregroundColor),
                      ),
                      PriceTile(product),
                    ],
                  ),
                  const SizedBox(width: 2),
                  CartQuantity(
                      product: product, foregroundColor: foregroundColor),
                  const SizedBox(width: 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
