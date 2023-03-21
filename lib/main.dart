import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'core/injection.dart';
import 'firebase_options.dart';
import 'modules/cart/business_logic/cart_controller.dart';
import 'modules/favourites/business_logic/favourites_controller.dart';

//TODO: OnBoarding ui
//TODO: Facebook , Google Auth
//TODO: notifications
//TODO: Mapping(GeoLocator, GeoCoding, google maps)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initServiceLocator();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await FavouritesController.getFavIdListFromCache();
  await CartController.getCartIdListFromCache();

  runApp(MyApp.getInstance());
}
