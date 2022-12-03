import 'package:e_commerce/modules/favourites/controllers/favourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/entities/products.dart';

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
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Consumer<FavouritesController>(
          builder: (context, value, child) {
            return Center(
              child: IconButton(
                splashColor: Colors.transparent,
                onPressed: () => value.updateFavouriteItemId(product),
                icon: product.isFavourite
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border, color: Colors.grey),
              ),
            );
          },
        ),
      ),
    );
  }
}
