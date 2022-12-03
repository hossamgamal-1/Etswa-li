import 'package:flutter/material.dart';
import '../../../data/entities/products.dart';
import '../../../data/database/products_data_services.dart';

class SearchController with ChangeNotifier {
  List<Product> searchedProducts = [];
  String searchValue = '';
  void search(String searchBarValue) {
    searchBarValue.length > 2
        ? searchedProducts = ProductsDataGetter.products
            .where((product) => product.title
                .toLowerCase()
                .contains(searchBarValue.toLowerCase()))
            .toList()
        : searchedProducts = [];
    searchValue = searchBarValue;
    notifyListeners();
  }

  searchedProductsReset() {
    searchedProducts = [];
    notifyListeners();
  }
}
