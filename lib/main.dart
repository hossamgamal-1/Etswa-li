import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';

import 'core/injection.dart';
import 'core/themes/app_light_theme.dart';
import 'modules/favourites/controllers/favourites_controller.dart';
import 'ui/controllers/home_page_controller.dart';
import 'modules/search/controllers/search_controller.dart';
import 'ui/screens/home_page.dart';

//TODO: Cart feature with mapping
//TODO: PRoduct Page is mod7eka

//carosel images in each productCard

//TODO: Auth feature

//TODO: professional handling of colors & Texts & TextStyles

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  await FlutterStatusbarcolor.setNavigationBarColor(const Color(0xffffffff));
  await FlutterStatusbarcolor.setStatusBarColor(const Color(0xffffffff));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await FavouritesController.getFavIdListFromDisk();
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
        ChangeNotifierProvider(create: (context) => SearchController())
      ],
      builder: (context, child) => ScreenUtilInit(
        designSize: const Size(100, 100),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'etswa\'li',
          theme: appLightTheme.themeData,
          home: const HomePage(),
        ),
      ),
    );
  }
}
