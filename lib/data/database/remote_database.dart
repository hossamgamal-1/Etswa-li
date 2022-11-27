import 'dart:convert';

import 'package:e_commerce/core/app_constants.dart';
import 'package:e_commerce/data/entities/products.dart';
import 'package:http/http.dart' as http;

class RemoteDatabase {
  static String productsUrl =
      '${AppConstants.baseUrl}${AppConstants.productsEndpoint}';
  static List<Product> products = [];

  static Future<void> getProductsData() async {
    http.Response response = await http.get(Uri.parse(productsUrl));
    List dataList = json.decode(response.body);
    for (var i = 0; i < dataList.length; i++) {
      Product product = Product.fromJson(dataList[i]);
      products.add(product);
    }
  }

  static String categoriesUrl =
      '${AppConstants.baseUrl}${AppConstants.categoriesEndpoint}';
  static List<String> categories = [];

  static Future<void> getCategoriesData() async {
    http.Response response = await http.get(Uri.parse(categoriesUrl));
    List dataList = json.decode(response.body);
    for (var category in dataList) {
      categories.add(category);
    }
    // print(categories);
  }
}
