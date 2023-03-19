import 'dart:convert';

import '../../core/app_constants.dart';
import 'package:http/http.dart' as http;

import '../model/product_details.dart';

abstract class ProductDetailsService {
  Future<ProductDetails> getProductDetails(int productId);
}

class ProductDetailsGetter implements ProductDetailsService {
  @override
  Future<ProductDetails> getProductDetails(int productId) async {
    String productsUrl =
        '${AppConstants.baseUrl}${AppConstants.productsEndpoint}/$productId';
    http.Response response = await http.get(Uri.parse(productsUrl));
    var data = json.decode(response.body);

    ProductDetails receivedProduct = ProductDetails.fromJson(data);

    return receivedProduct;
  }
}
