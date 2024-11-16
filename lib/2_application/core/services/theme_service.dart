import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  //ChangeNotifier reflect changes immediately
  bool isDarkModeOn =
      true; //Declare and initialized boolean variable to false value and same variable will be used

  void toggleTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }
}
