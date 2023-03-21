import 'dart:convert';

import '../../core/app_constants.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

abstract class ProductDetailsService {
  Future<ProductModel> getProductDetails(int productId);
}

class ProductDetailsGetter implements ProductDetailsService {
  @override
  Future<ProductModel> getProductDetails(int productId) async {
    String productsUrl =
        '${AppConstants.baseUrl}${AppConstants.productsEndpoint}/$productId';
    http.Response response = await http.get(Uri.parse(productsUrl));
    var data = json.decode(response.body);

    ProductModel receivedProduct = ProductModel.fromJson(data);

    return receivedProduct;
  }
}
