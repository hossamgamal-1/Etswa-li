import 'package:e_commerce/data/database/remote_database.dart';

import '../../data/model/product_model.dart';

abstract class ProductDetailsGetterBaseUseCase {
  Future<ProductModel> getProductDetails(int productId);
}

class ProductDetailsGetterUseCase implements ProductDetailsGetterBaseUseCase {
  final RemoteDatabase remoteDatabase;

  ProductDetailsGetterUseCase(this.remoteDatabase);

  @override
  Future<ProductModel> getProductDetails(int productId) {
    return remoteDatabase.getProductDetails(productId);
  }
}
