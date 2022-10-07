import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final int crossCount;
  final int itemCount;
  final Widget Function(BuildContext, double, int) builder;
  final double spacing;
  const GridWidget({
    Key? key,
    required this.crossCount,
    required this.itemCount,
    required this.builder,
    this.spacing = 13.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, box) {
        final width =
            (box.maxWidth - ((crossCount - 1) * spacing)) / crossCount;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(
            itemCount,
            (index) => builder(context, width, index),
          ),
        );
      },
    );
  }
}
