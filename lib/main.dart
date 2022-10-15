import 'package:flutter/material.dart';
import 'package:hacktoberfest/controller/dark_theme_provider.dart';
import 'package:hacktoberfest/screens/home_view.dart';

import 'package:hacktoberfest/themes/dark_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();
  DarkTheme darkTheme = DarkTheme();

  void getCurrentAppTheme() async {
    themeProvider.dTheme = await themeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (
          BuildContext context,
          _,
          child,
        ) {
          return MaterialApp(
            // Hide the debug banner
            debugShowCheckedModeBanner: false,
            title: '1stHacktoberfest',
            home: HomeView(),
            theme: DarkTheme.theme(context, themeProvider.dTheme),
          );
        },
      ),
    );
  }
}
