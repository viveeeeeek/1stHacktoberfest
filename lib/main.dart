import 'package:flutter/material.dart';
import 'package:hacktoberfest/hacktoberfest_app.dart';
import 'package:provider/provider.dart';
import 'controller/dark_theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (ctx) => DarkThemeProvider(), child: const HacktoberfestApp()));
}
