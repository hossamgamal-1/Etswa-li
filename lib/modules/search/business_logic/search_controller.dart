import 'package:flutter/material.dart';

import '../../../data/database/products_data_services.dart';
import '../../../data/model/product_model.dart';

class SearchController with ChangeNotifier {
  List<ProductModel> searchedProducts = [];
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
