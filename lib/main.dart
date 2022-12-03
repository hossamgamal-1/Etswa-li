import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';

import 'core/injection.dart';
import 'core/themes/app_light_theme.dart';
import 'ui/controllers/home_page_controller.dart';
import 'ui/controllers/search_controller.dart';
import 'ui/screens/home_page.dart';

//TODO: images in seeAll page need to take border Radius
//TODO: professional handling of colors & Texts & TextStyles
//TODO: PRoduct Page is mod7eka
//TODO: Search feature
//TODO: Auth feature
//TODO: Cart feature with mapping
//TODO: carosel images in each productCard
//TODO: Shareadprefs save favorite Ids
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  await FlutterStatusbarcolor.setNavigationBarColor(const Color(0xcfffffff));
  await FlutterStatusbarcolor.setStatusBarColor(const Color(0xcfffffff));

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
