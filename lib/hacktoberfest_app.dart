import 'package:flutter/material.dart';
import 'package:hacktoberfest/controller/dark_theme_provider.dart';
import 'package:hacktoberfest/screens/home_view.dart';
import 'package:hacktoberfest/themes/dark_theme.dart';
import 'package:provider/provider.dart';

class HacktoberfestApp extends StatefulWidget {
  const HacktoberfestApp({Key? key}) : super(key: key);

  @override
  State<HacktoberfestApp> createState() => _HacktoberfestAppState();
}

class _HacktoberfestAppState extends State<HacktoberfestApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<DarkThemeProvider>(context, listen: false).getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(builder: (context, themeProvider, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '1stHacktoberfest',
        home: const HomeView(),
        theme: DarkTheme.theme(context, themeProvider.dTheme),
      );
    });
  }
}
