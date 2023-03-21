import 'package:e_commerce/data/database/remote_database.dart';

abstract class CategoriesDataGetterBaseUseCase {
  Future<void> getCategoriesData();
}

class CategoriesDataGetterUseCase implements CategoriesDataGetterBaseUseCase {
  final RemoteDatabase remoteDatabase;

  CategoriesDataGetterUseCase(this.remoteDatabase);

  @override
  Future<void> getCategoriesData() {
    return remoteDatabase.getCategoriesData();
  }
}
