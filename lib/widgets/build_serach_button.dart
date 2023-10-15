import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hacktoberfest/widgets/tap_effect.dart';

TapEffect buildSearchButton(void Function() onSearch) {
  return TapEffect(
    onClick: onSearch,
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromRGBO(153, 69, 255, 1), Color(0xFFff8ae0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(FeatherIcons.search, color: Colors.white),
    ),
  );
}
