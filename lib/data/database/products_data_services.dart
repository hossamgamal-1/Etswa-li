import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/app_constants.dart';
import '../entities/products.dart';

abstract class ProductsDataService {
  Future<void> getProductsData();
}

class ProductsDataGetter implements ProductsDataService {
  static List<Product> products = [];
  int times = 0;
  @override
  Future<void> getProductsData() async {
    String productsUrl =
        '${AppConstants.baseUrl}${AppConstants.productsEndpoint}'; //?limit=20&offset=${20 * times}
    if (products.isEmpty) {
      http.Response response = await http.get(Uri.parse(productsUrl));
      List dataList = json.decode(response.body);
      for (var i = 0; i < dataList.length; i++) {
        Product product = Product.fromJson(dataList[i]);
        products.add(product);
      }
      times++;
    }
  }
}
