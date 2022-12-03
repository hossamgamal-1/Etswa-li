import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController with ChangeNotifier {
  int bottomNavigatorIndex = 0;
  bottomNavigatorIndexSetter(int newNavIndex) {
    bottomNavigatorIndex = newNavIndex;
    notifyListeners();
  }
}
