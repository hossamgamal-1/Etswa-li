import 'package:e_commerce/data/database/remote_database.dart';

abstract class ProductsDataGetterBaseUseCase {
  Future<void> getProductsData();
}

class ProductsDataGetterUseCase implements ProductsDataGetterBaseUseCase {
  final RemoteDatabase remoteDatabase;

  ProductsDataGetterUseCase(this.remoteDatabase);

  @override
  Future<void> getProductsData() {
    return remoteDatabase.getProductsData();
  }
}
