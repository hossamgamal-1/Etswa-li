import 'package:e_commerce/data/database/remote_database.dart';

abstract class ProductsDataGetterBaseUseCase {
  Future<void> getProductsData();
}

class ProductsDataGetterUseCase implements ProductsDataGetterBaseUseCase {
  final BaseRemoteDatabase baseRemoteDatabase;

  ProductsDataGetterUseCase(this.baseRemoteDatabase);

  @override
  Future<void> getProductsData() {
    return baseRemoteDatabase.getProductsData();
  }
}
