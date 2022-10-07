import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:hacktoberfest/widgets/tap_effect.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onSearch;
  final void Function(String) onChanged;
  const SearchBar({
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  isDense: true,
                  fillColor: Colors.white,
                  hintText: 'Search Here',
                  hintStyle: TextStyle(color: Colors.black),
                ),
                textInputAction: TextInputAction.search,
                onEditingComplete: onSearch,
                onChanged: onChanged,
              ),
            ),
          ),
          const SizedBox(width: 10),
          TapEffect(
            onClick: onSearch,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(153, 69, 255, 1), Color(0xFFff8ae0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(FeatherIcons.search, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
