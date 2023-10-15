import 'package:flutter/material.dart';

Container buildInput(TextEditingController controller, void Function() onSearch,
    void Function(String p1) onChanged) {
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
