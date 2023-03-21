import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/fonts_manager.dart';
import '../../../data/database/products_data_services.dart';
import '../../../data/model/product_model.dart';
import '../business_logic/cart_controller.dart';
import 'components/cart_product_tile.dart';
import '../../../presentation/components/core/list_staggered_animation.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<CartController>();
    List<ProductModel> getProductsFromCartIds = [];
    watch.fakeTotal = 0;
    watch.fakeOffer = 0;
    for (int id in CartController.cartProductsIds) {
      if (ProductsDataGetter.productsIds.contains(id)) {
        ProductModel cartProduct = ProductsDataGetter.products
            .firstWhere((product) => product.id == id);

        getProductsFromCartIds.add(cartProduct);
      }
    }

    for (ProductModel product in getProductsFromCartIds) {
      watch.fakeTotal =
          watch.fakeTotal + (product.fakePrice * product.quantity);
      watch.fakeOffer = watch.fakeOffer +
          ((product.fakePrice - product.price) * product.quantity);
    }
    return getProductsFromCartIds.isEmpty
        ? Center(
            child: Text(
              'You have no cart items yet.',
              style: getRegularTextStyle(
                  color: ColorManager.black, fontSize: FontSize.s4_4.sp),
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
                      style: getRegularTextStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s4_8.sp),
                      children: [
                        TextSpan(
                            text: watch.fakeTotal == 0
                                ? '0'
                                : '${(watch.fakeTotal - watch.fakeOffer).ceilToDouble() - 0.01}\$',
                            style: getRegularTextStyle(
                                color: ColorManager.offerPriceColor,
                                fontSize: FontSize.s4_8.sp)),
                        TextSpan(
                            text: watch.fakeTotal == 0
                                ? null
                                : '${watch.fakeTotal.ceilToDouble() - 0.01}\$',
                            style: getRegularTextStyle(
                                    color: ColorManager.unSelectedIconColor,
                                    fontSize: FontSize.s3.sp)
                                .copyWith(
                              decoration: TextDecoration.lineThrough,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.primaryColor,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ColorManager.transparent),
                      ),
                      child: Text('Check Out',
                          style: getMediumTextStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s3_2.sp)),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
