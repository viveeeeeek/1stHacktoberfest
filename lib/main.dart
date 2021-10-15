import 'package:flutter/material.dart';
import 'package:hacktoberfest/controller/dark_theme_preference.dart';
import 'package:hacktoberfest/controller/dark_theme_provider.dart';

import 'package:hacktoberfest/screens/homepage.screens.dart';
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

  void getCurrentAppTheme() async{
    themeProvider.dTheme = await themeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentAppTheme();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_){
        return themeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context,_, child,){
          return  MaterialApp(
            // Hide the debug banner
            debugShowCheckedModeBanner: false,
            title: '1stHacktoberfest',
            home: themeProvider.dTheme? HomePage(darkMode: true): HomePage(),
            theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange)),
          );
        },

      ),
    );
  }
}
