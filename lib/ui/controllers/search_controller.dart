import 'package:e_commerce/data/database/products_data_services.dart';
import 'package:e_commerce/data/entities/products.dart';
import 'package:flutter/cupertino.dart';

class SearchController with ChangeNotifier {
  List<Product> search(String searchBarValue) {
    List<Product> searchedProducts = ProductsDataGetter.products
        .where((product) => product.title.contains(searchBarValue))
        .toList();
    return searchedProducts;
  }
}
