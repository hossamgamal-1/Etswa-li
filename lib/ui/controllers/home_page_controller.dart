import 'package:e_commerce/data/entities/products.dart';
import 'package:flutter/material.dart';

class HomePageController with ChangeNotifier {
  int bottomNavigatorIndex = 0;
  bottomNavigatorIndexSetter(int newNavIndex) {
    bottomNavigatorIndex = newNavIndex;
    notifyListeners();
  }

  // List<int?> favouriteItemsIds =
  //     List.generate(RemoteDatabase.products.length, (index) => null);
  List<int> favouriteItemsIds = [];
  Icon favIcon(Product product) {
    return favouriteItemsIds[product.id - 1] == product.id
        ? const Icon(Icons.favorite_border)
        : const Icon(Icons.favorite);
  }

  addFavouriteItemId(Product product) {
    favouriteItemsIds.add(product.id);
    product.isFavourite = true;
    //favouriteItemsIds.add(product.id);
    notifyListeners();
  }

  removeFavouriteItemId(Product product) {
    favouriteItemsIds.remove(product.id);
    product.isFavourite = false;
    notifyListeners();
  }
}
