import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'build_input.dart';
import 'build_serach_button.dart';
import 'tap_effect.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onSearch;
  final void Function(String) onChanged;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.onSearch,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: buildInput(controller,onSearch,onChanged),
          ),
          const SizedBox(width: 10),
          buildSearchButton(onSearch),
        ],
      ),
    );
  }

}
