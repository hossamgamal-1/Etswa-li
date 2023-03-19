import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../core/app_constants.dart';
import '../model/product.dart';

abstract class ProductsDataService {
  Future<void> getProductsData();
}

class ProductsDataGetter implements ProductsDataService {
  static List<Product> products = [];
  static List<int> productsIds = [];
  int times = 0;
  @override
  Future<void> getProductsData() async {
    String productsUrl =
        '${AppConstants.baseUrl}${AppConstants.productsEndpoint}?limit=20&offset=${20 * times}'; //?limit=20&offset=${20 * times}';
    if (products.isEmpty /* || products.length < 20 * times */) {
      try {
        http.Response response = await http.get(Uri.parse(productsUrl));
        List dataList = json.decode(response.body);
        productsIds = products.map((product) => product.id).toList();
        for (int i = 0; i < dataList.length; i++) {
          Product receivedProduct = Product.fromJson(dataList[i]);
          if (!productsIds.contains(receivedProduct.id)) {
            products.add(receivedProduct);
          }
        }
        // times++;
        if (kDebugMode) {
          print(products.length);
        }
      } catch (error) {
        debugPrint(error.toString());
      }
    }
    times++;
  }
}
