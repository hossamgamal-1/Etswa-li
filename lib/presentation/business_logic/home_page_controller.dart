import 'package:flutter/material.dart';

class HomePageController with ChangeNotifier {
  int bottomNavigatorIndex = 0;
  bottomNavigatorIndexSetter(int newNavIndex) {
    bottomNavigatorIndex = newNavIndex;
    notifyListeners();
  }
}
