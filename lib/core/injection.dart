import 'package:get_it/get_it.dart';

import '../data/database/remote_database.dart';
import '../data/database/products_data_services.dart';
import '../data/database/category_data_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<RemoteDatabase>(
    () => RemoteDatabase(getIt(), getIt()),
  );
  getIt.registerLazySingleton<ProductsDataService>(
    () => ProductsDataGetter(),
  );
  getIt.registerLazySingleton<CategoryDataService>(
    () => CategoryDataGetter(),
  );
}
