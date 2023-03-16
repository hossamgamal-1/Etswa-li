import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/resources/app_text_styles.dart';
import '../../../core/resources/color_manager.dart';
import '../../../data/entities/products.dart';
import '../../screens/product_page.dart';
import 'favourite_button.dart';
import 'offer_percentage_circle.dart';
import 'price_tile.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.products, required this.index, super.key});
  final List<Product> products;
  final int index;
  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Container()
        : Stack(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: ProductPage(products[index]),
                    duration: const Duration(milliseconds: 300),
                    type: PageTransitionType.fade,
                  ),
                ),
                child: ImagePixels(
                  defaultColor: ColorManager.white,
                  imageProvider:
                      CachedNetworkImageProvider(products[index].imageUrls[0]),
                  builder: (context, image) {
                    Color backgroundColor =
                        image.pixelColorAt!(0, 0).withOpacity(0.9);
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 45.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  products[index].imageUrls[0],
                                ),
                              ),
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 2.w,
                              vertical: 1.w,
                            ),
                          ),
                          Center(
                            child: Text(
                              products[index].title,
                              style: AppTextStyles.productTitle.copyWith(
                                color:
                                    ((backgroundColor.computeLuminance() > 0.5))
                                        ? ColorManager.white
                                        : ColorManager.black,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          PriceTile(products[index]),
                        ],
                      ),
                    );
                  },
                ),
              ),
              OfferPercentageCircle(products[index]),
              Positioned(
                top: 3,
                right: 8,
                child: FavouriteButton(products[index]),
              ),
            ],
          );
  }
}
