import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../../data/model/product.dart';
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
        color: ColorManager.white,
      ),
      child: Consumer<FavouritesController>(
        builder: (context, value, _) {
          return Center(
            child: IconButton(
              splashColor: ColorManager.transparent,
              onPressed: () => value.updateFavouriteItemIdsList(product),
              icon: product.isFavourite
                  ? Icon(
                      Icons.favorite,
                      color: ColorManager.offerPriceColor,
                      size: 5.w,
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: ColorManager.unSelectedIconColor,
                      size: 5.w,
                    ),
            ),
          );
        },
      ),
    );
  }
}
