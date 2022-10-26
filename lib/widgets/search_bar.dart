import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'tap_effect.dart';

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
            child: _buildInput(),
          ),
          const SizedBox(width: 10),
          _buildSearchButton(),
        ],
      ),
    );
  }

  Container _buildInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(1, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: controller.text.isEmpty
              ? null
              : MouseRegion(
                  cursor: SystemMouseCursors.basic,
                  child: GestureDetector(
                    onTap: () {
                      controller.clear();
                      onSearch();
                    },
                    child: const Icon(Icons.clear),
                  ),
                ),
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
          hintStyle: const TextStyle(color: Colors.black),
        ),
        textInputAction: TextInputAction.search,
        onEditingComplete: onSearch,
        onChanged: onChanged,
      ),
    );
  }

  TapEffect _buildSearchButton() {
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
}
