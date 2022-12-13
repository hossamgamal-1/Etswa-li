import 'package:e_commerce/core/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../data/entities/products.dart';
import '../../../modules/favourites/controllers/favourites_controller.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 9.w,
      height: 9.w,
      alignment: Alignment.bottomRight,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppLightTheme.canvasColor,
      ),
      child: Consumer<FavouritesController>(
        builder: (context, value, _) {
          return Center(
            child: IconButton(
              splashColor: AppLightTheme.transperantColor,
              onPressed: () => value.updateFavouriteItemIdsList(product),
              icon: product.isFavourite
                  ? Icon(
                      Icons.favorite,
                      color: AppLightTheme.offerPriceColor,
                      size: 5.w,
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: AppLightTheme.unSelectedIconColor,
                      size: 5.w,
                    ),
            ),
          );
        },
      ),
    );
  }
}
