import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/injection.dart';
import 'core/themes/app_light_theme.dart';
import 'modules/authentication/controller/email_password_auth_controller.dart';
import 'modules/authentication/controller/phone_auth_controller.dart';
import 'modules/authentication/ui/main_auth_page.dart';
import 'modules/cart/controllers/cart_controller.dart';
import 'modules/favourites/controllers/favourites_controller.dart';
import 'modules/search/controllers/search_controller.dart';
import 'ui/screens/home_page.dart';
import 'ui/controllers/home_page_controller.dart';
import 'ui/controllers/product_page_controller.dart';
import 'firebase_options.dart';

//TODO: Facebook , Google Auth
//TODO: notification
//TODO: Mapping(GeoLocator, GeoCoding)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initGetIt();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await FavouritesController.getFavIdListFromCache();
  await CartController.getCartIdListFromCache();
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
        ChangeNotifierProvider(
          create: (context) => EmailPasswordAuthController(),
        ),
        ChangeNotifierProvider(create: (context) => PhoneAuthController()),
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
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
