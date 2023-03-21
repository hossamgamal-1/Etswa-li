import 'package:e_commerce/data/database/product_details_service.dart';
import 'package:e_commerce/domain/use_cases/get_product_details.dart';
import 'package:e_commerce/domain/use_cases/get_products_list.dart';
import 'package:get_it/get_it.dart';

import '../data/database/remote_database.dart';
import '../data/database/products_data_services.dart';
import '../data/database/category_data_services.dart';
import '../domain/use_cases/get_categories_list.dart';
import '../modules/authentication/auth.dart';
import '../modules/authentication/email_password_auth.dart';
import '../modules/authentication/phone_auth.dart';

final sL = GetIt.instance;

void initServiceLocator() {
  //Data injection
  sL.registerLazySingleton<BaseRemoteDatabase>(
      () => RemoteDatabase(sL(), sL(), sL()));
  sL.registerLazySingleton<ProductsDataService>(() => ProductsDataGetter());
  sL.registerLazySingleton<CategoryDataService>(() => CategoryDataGetter());
  sL.registerLazySingleton<ProductDetailsService>(() => ProductDetailsGetter());

  //Use Cases injection
  sL.registerLazySingleton<ProductsDataGetterBaseUseCase>(
      () => ProductsDataGetterUseCase(sL()));
  sL.registerLazySingleton<CategoriesDataGetterBaseUseCase>(
      () => CategoriesDataGetterUseCase(sL()));
  sL.registerLazySingleton<ProductDetailsGetterBaseUseCase>(
      () => ProductDetailsGetterUseCase(sL()));

  //Modules injection
  sL.registerLazySingleton<Auth>(() => Auth(sL(), sL()));
  sL.registerLazySingleton<EmailAndPasswordAuthService>(
      () => EmailAndPasswordAuthHandler());
  sL.registerLazySingleton<PhoneAuthService>(() => PhoneAuthHandler());
}
