import 'package:flutter/cupertino.dart';
import 'package:hacktoberfest/controller/dark_theme_preference.dart';

class DarkThemeProvider with ChangeNotifier{

  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _dtheme = false;

  bool get dTheme => _dtheme;

  set dTheme(bool val){
    _dtheme = val;
    darkThemePreference.setDarkTheme(val);
    notifyListeners();

  }
}