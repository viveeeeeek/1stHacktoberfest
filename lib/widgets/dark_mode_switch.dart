import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/dark_theme_provider.dart';
import 'tap_effect.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkThemeProvider>(context).dTheme;
    return TapEffect(
      onClick: () {
        var x = Provider.of<DarkThemeProvider>(
          context,
          listen: false,
        );
        x.dTheme = !x.dTheme;
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (isDark ? Colors.white : Colors.black),
        ),
        child: Center(
          child: Icon(
            FeatherIcons.sun,
            color: isDark ? Colors.black : Colors.yellow,
          ),
        ),
      ),
    );
  }
}
