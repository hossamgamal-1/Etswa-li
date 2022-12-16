import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/entities/products.dart';

class CartController with ChangeNotifier {
  static List<int> cartProductsIds = [];
  double fakeTotal = 0;
  double fakeOffer = 0;
  removeQuantity(Product product) {
    product.quantity > 0 ? product.quantity-- : null;
    notifyListeners();
  }

  addQuantity(Product product) {
    product.quantity++;
    notifyListeners();
  }

  addToCart(int id) {
    if (!cartProductsIds.contains(id)) {
      cartProductsIds.add(id);
      setCartIdListToCache();
      notifyListeners();
    }
  }

  removeFromCart(int id) {
    cartProductsIds.remove(id);
    setCartIdListToCache();
    notifyListeners();
  }

  static Future<void> getCartIdListFromCache() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> savedCartList = preferences.getStringList('favCartList') ?? [];

    cartProductsIds =
        savedCartList.map((stringId) => int.parse(stringId)).toList();
  }

  Future<void> setCartIdListToCache() async {
    List<String> cartIdStringList =
        cartProductsIds.map((intId) => intId.toString()).toList();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setStringList('favCartList', cartIdStringList);
  }
}
