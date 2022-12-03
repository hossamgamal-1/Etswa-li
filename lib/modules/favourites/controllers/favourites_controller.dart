import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/entities/products.dart';

class FavouritesController with ChangeNotifier {
  static List<int> favouriteItemsIds = [];

  Icon favIcon(Product product) {
    return favouriteItemsIds[product.id - 1] == product.id
        ? const Icon(Icons.favorite_border)
        : const Icon(Icons.favorite);
  }

  void updateFavouriteItemId(Product product) {
    if (favouriteItemsIds.contains(product.id)) {
      favouriteItemsIds.remove(product.id);
      product.isFavourite = false;
    } else {
      favouriteItemsIds.add(product.id);
      product.isFavourite = true;
    }
    notifyListeners();
    setFavIdListToDisk();
  }

  Future<void> setFavIdListToDisk() async {
    List<String> favIdStringList =
        favouriteItemsIds.map((intId) => intId.toString()).toList();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setStringList('favIdList', favIdStringList);
  }

  static Future<void> getFavIdListFromDisk() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> savedFavList = preferences.getStringList('favIdList') ?? [];

    favouriteItemsIds =
        savedFavList.map((stringId) => int.parse(stringId)).toList();
  }
}
