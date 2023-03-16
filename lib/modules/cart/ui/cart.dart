import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/app_text_styles.dart';
import '../../../core/resources/color_manager.dart';
import '../../../data/database/products_data_services.dart';
import '../../../data/entities/products.dart';
import '../controllers/cart_controller.dart';
import 'components/cart_product_tile.dart';
import '../../../ui/components/core/list_staggered_animation.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<CartController>();
    List<Product> getProductsFromCartIds = [];
    watch.fakeTotal = 0;
    watch.fakeOffer = 0;
    for (int id in CartController.cartProductsIds) {
      if (ProductsDataGetter.productsIds.contains(id)) {
        Product cartProduct = ProductsDataGetter.products
            .firstWhere((product) => product.id == id);

        getProductsFromCartIds.add(cartProduct);
      }
    }

    for (Product product in getProductsFromCartIds) {
      watch.fakeTotal =
          watch.fakeTotal + (product.fakePrice * product.quantity);
      watch.fakeOffer = watch.fakeOffer +
          ((product.fakePrice - product.price) * product.quantity);
    }
    return getProductsFromCartIds.isEmpty
        ? Center(
            child: Text(
              'You have no cart items yet.',
              style: AppTextStyles.mainTitle,
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 74.h,
                child: AnimationLimiter(
                  child: ListView.builder(
                    itemCount: getProductsFromCartIds.length,
                    itemBuilder: (context, index) => ListStaggeredAnimation(
                      child: CartProductTile(getProductsFromCartIds[index]),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Total: ',
                      style: AppTextStyles.productPageDiscribtionTextStyle,
                      children: [
                        TextSpan(
                          text: watch.fakeTotal == 0
                              ? '0'
                              : '${(watch.fakeTotal - watch.fakeOffer).ceilToDouble() - 0.01}\$',
                          style: AppTextStyles.productTitle.copyWith(
                            fontSize: 4.8.sp,
                            color: ColorManager.offerPriceColor,
                          ),
                        ),
                        TextSpan(
                          text: watch.fakeTotal == 0
                              ? null
                              : '${watch.fakeTotal.ceilToDouble() - 0.01}\$',
                          style: AppTextStyles.productTitle.copyWith(
                            fontSize: 2.8.sp,
                            color: ColorManager.unSelectedIconColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.cursorColor,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ColorManager.transparent),
                      ),
                      child: Text(
                        'Check Out',
                        style: AppTextStyles.productPageButtonTextStyle
                            .copyWith(fontSize: 3.3.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
