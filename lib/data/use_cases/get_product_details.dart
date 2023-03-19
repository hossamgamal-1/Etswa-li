import 'package:e_commerce/data/database/remote_database.dart';

import '../model/product_details.dart';

abstract class ProductDetailsGetterBaseUseCase {
  Future<ProductDetails> getProductDetails(int productId);
}

class ProductDetailsGetterUseCase implements ProductDetailsGetterBaseUseCase {
  final RemoteDatabase remoteDatabase;

  ProductDetailsGetterUseCase(this.remoteDatabase);

  @override
  Future<ProductDetails> getProductDetails(int productId) {
    return remoteDatabase.getProductDetails(productId);
  }
}
