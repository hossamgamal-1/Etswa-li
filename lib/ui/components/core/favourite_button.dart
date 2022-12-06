import 'package:e_commerce/core/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/entities/products.dart';
import '../../../modules/favourites/controllers/favourites_controller.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 3,
      right: 8,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          color: AppLightTheme.canvasColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Consumer<FavouritesController>(
          builder: (context, value, child) {
            return Center(
              child: IconButton(
                splashColor: AppLightTheme.transperantColor,
                onPressed: () => value.updateFavouriteItemIdsList(product),
                icon: product.isFavourite
                    ? const Icon(Icons.favorite,
                        color: AppLightTheme.offerPriceColor)
                    : const Icon(Icons.favorite_border,
                        color: AppLightTheme.unSelectedIconColor),
              ),
            );
          },
        ),
      ),
    );
  }
}
