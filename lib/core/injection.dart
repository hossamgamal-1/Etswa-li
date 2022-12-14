import 'package:get_it/get_it.dart';

import '../data/database/remote_database.dart';
import '../data/database/products_data_services.dart';
import '../data/database/category_data_services.dart';
import '../modules/authentication/auth.dart';
import '../modules/authentication/email_password_auth.dart';
import '../modules/authentication/phone_auth.dart';

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
  getIt.registerLazySingleton<Auth>(() => Auth(getIt(), getIt()));
  getIt.registerLazySingleton<EmailAndPasswordAuthService>(
      () => EmailAndPasswordAuthHandler());
  getIt.registerLazySingleton<PhoneAuthService>(() => PhoneAuthHandler());
}
