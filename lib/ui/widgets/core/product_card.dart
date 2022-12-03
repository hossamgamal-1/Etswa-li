import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'price_tile.dart';
import 'offer_percentage_circle.dart';
import 'favourite_button.dart';
import '../../../core/app_text_styles.dart';
import '../../../ui/screens/product_page.dart';
import '../../../data/entities/products.dart';

//hero
class ProductCard extends StatelessWidget {
  const ProductCard({required this.products, required this.index, super.key});
  final List<Product> products;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            defaultColor: Colors.white,
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
                        horizontal: 5.w,
                        vertical: 1.w,
                      ),
                    ),
                    Center(
                      child: Text(
                        products[index].title,
                        style: AppTextStyles().productTitle.copyWith(
                              color: useWhiteForeground(backgroundColor)
                                  ? Colors.white
                                  : Colors.black,
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
        FavouriteButton(products[index]),
      ],
    );
  }
}
