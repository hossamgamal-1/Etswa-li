import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../presentation/resources/app_light_theme.dart';
import '../modules/authentication/business_logic/email_password_auth_controller.dart';
import '../modules/authentication/business_logic/phone_auth_controller.dart';
import '../modules/authentication/presentation/main_auth_page.dart';
import '../modules/cart/business_logic/cart_controller.dart';
import '../modules/favourites/business_logic/favourites_controller.dart';
import '../modules/search/business_logic/search_controller.dart';
import '../presentation/business_logic/home_page_controller.dart';
import '../presentation/business_logic/product_page_controller.dart';
import '../presentation/screens/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static MyApp? _myApp;

  static MyApp getInstance() {
    _myApp ??= const MyApp._internal();
    return _myApp!;
  }

  @override
  Widget build(BuildContext context) {
    AppLightTheme appLightTheme = AppLightTheme();
    return MultiProvider(
      providers: AppProviders.appProviders,
      builder: (context, child) => ScreenUtilInit(
        designSize: const Size(100, 100),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'etswa\'li',
          theme: appLightTheme.themeData,
          home: FirebaseAuth.instance.currentUser != null
              ? const HomePage()
              : const MainAuthPage(),
        ),
      ),
    );
  }
}

class AppProviders {
  static List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider(create: (context) => HomePageController()),
    ChangeNotifierProvider(create: (context) => FavouritesController()),
    ChangeNotifierProvider(create: (context) => SearchController()),
    ChangeNotifierProvider(create: (context) => ProductPageController()),
    ChangeNotifierProvider(create: (context) => EmailPasswordAuthController()),
    ChangeNotifierProvider(create: (context) => PhoneAuthController()),
    ChangeNotifierProvider(create: (context) => CartController()),
  ];
}
