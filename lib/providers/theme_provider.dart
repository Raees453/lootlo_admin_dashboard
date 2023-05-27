import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode? _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  ThemeMode get themeMode => _themeMode ?? ThemeMode.light;

  ThemeMode themeFromBrightness(Brightness brightness) =>
      brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;

  ThemeMode revertTheme(Brightness brightness) =>
      brightness == Brightness.light ? ThemeMode.dark : ThemeMode.light;

}
