import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

import 'core/themes/app_light_theme.dart';
import 'ui/controllers/home_page_controller.dart';
import 'ui/screens/home_page.dart';
import 'data/database/remote_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RemoteDatabase.getProductsData();
  await RemoteDatabase.getCategoriesData();
  await FlutterStatusbarcolor.setNavigationBarColor(const Color(0xcfffffff));
  await FlutterStatusbarcolor.setStatusBarColor(const Color(0xcfffffff));

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppLightTheme appLightTheme = AppLightTheme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageController()),
      ],
      builder: (context, child) => ScreenUtilInit(
        designSize: const Size(100, 100),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce',
          theme: appLightTheme.themeData,
          home: const HomePage(),
        ),
      ),
    );
  }
}
