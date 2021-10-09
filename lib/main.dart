import 'package:flutter/material.dart';

import 'package:hacktoberfest/screens/homepage.screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: '1stHacktoberfest',
      home: HomePage(),
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange)),
    );
  }
}
