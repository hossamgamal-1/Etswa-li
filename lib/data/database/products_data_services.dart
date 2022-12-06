import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/app_constants.dart';
import '../entities/products.dart';

abstract class ProductsDataService {
  Future<void> getProductsData();
}

class ProductsDataGetter implements ProductsDataService {
  static List<Product> products = [];

  @override
  Future<void> getProductsData() async {
    String productsUrl =
        '${AppConstants.baseUrl}${AppConstants.productsEndpoint}'; //?limit=50&offset=${50 * times}';
    if (products.isEmpty) {
      http.Response response = await http.get(Uri.parse(productsUrl));
      List dataList = json.decode(response.body);
      for (int i = 0; i < dataList.length; i++) {
        try {
          products.add(Product.fromJson(dataList[i]));
        } catch (error) {
          print(error);
        }
      }
    }
  }
}
