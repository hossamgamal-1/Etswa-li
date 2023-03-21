import 'package:e_commerce/data/database/remote_database.dart';

abstract class CategoriesDataGetterBaseUseCase {
  Future<void> getCategoriesData();
}

class CategoriesDataGetterUseCase implements CategoriesDataGetterBaseUseCase {
  final BaseRemoteDatabase baseRemoteDatabase;

  CategoriesDataGetterUseCase(this.baseRemoteDatabase);

  @override
  Future<void> getCategoriesData() {
    return baseRemoteDatabase.getCategoriesData();
  }
}
