import 'package:flutter/material.dart';

Color colorProvider(int index) {
  if (index % 4 == 0) {
    return const Color(0xFFB6EDDC);
  } else if (index % 4 == 1) {
    return const Color(0xFFA3C26D);
  } else if (index % 4 == 2) {
    return const Color(0xFFCA7C00);
  } else {
    return const Color(0xFFDE430E);
  }
}