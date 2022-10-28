import 'package:flutter/cupertino.dart';

import 'dark_theme_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _dTheme = false;
  var _bgImg = "assets/img.png", banner = "assets/banner.png";
  bool get dTheme => _dTheme;
  String get bgImg => _bgImg;
  set dTheme(bool val) {
    _dTheme = val;
    darkThemePreference.setDarkTheme(val);
    if (val) {
      _bgImg = "assets/img1.png";
      banner = "assets/banner_dark.png";
    } else {
      _bgImg = "assets/img.png";
      banner = "assets/banner.png";
    }
    notifyListeners();
  }

  void getTheme() async {
    bool theme = await darkThemePreference.getTheme();
    dTheme = theme;
  }
}
