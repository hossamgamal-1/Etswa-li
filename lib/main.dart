import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/injection.dart';
import 'core/themes/app_light_theme.dart';
import 'modules/authentication/controller/auth_controller.dart';
import 'modules/authentication/ui/auth_page.dart';
import 'modules/favourites/controllers/favourites_controller.dart';
import 'modules/search/controllers/search_controller.dart';
import 'ui/screens/home_page.dart';
import 'ui/controllers/home_page_controller.dart';
import 'ui/controllers/product_page_controller.dart';

//TODO: Auth feature

//TODO: Cart feature with mapping

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await FavouritesController.getFavIdListFromCache();
  await AuthController.isLoggedInFn();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppLightTheme appLightTheme = AppLightTheme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageController()),
        ChangeNotifierProvider(create: (context) => FavouritesController()),
        ChangeNotifierProvider(create: (context) => SearchController()),
        ChangeNotifierProvider(create: (context) => ProductPageController()),
        ChangeNotifierProvider(create: (context) => AuthController()),
      ],
      builder: (context, child) => ScreenUtilInit(
        designSize: const Size(100, 100),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'etswa\'li',
          theme: appLightTheme.themeData,
          home: AuthController.isLoggedIn ? const HomePage() : const AuthPage(),
        ),
      ),
    );
  }
}
