import 'package:flutter/material.dart';

class AppAdaptiveGrid extends StatelessWidget {
  final List children;
  final double maxItemWidth;
  final Widget Function(BuildContext, int) itemBuilder;
  final void Function(int)? onItemTap;
  final double spacing;
  final double childAspectRatio;
  final int crossAxisCount;

  const AppAdaptiveGrid({
    super.key,
    required this.children,
    required this.itemBuilder,
    this.onItemTap,
    this.maxItemWidth = 200,
    this.spacing = 10,
    this.childAspectRatio = 1,
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    int intCrossAxisCount = crossAxisCount;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          intCrossAxisCount = 5; // desktop
        } else if (constraints.maxWidth > 800) {
          intCrossAxisCount = 3; // tablet
        }

        if (intCrossAxisCount < 1) intCrossAxisCount = 1;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: intCrossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onItemTap?.call(index),
              child: itemBuilder(context, index),
            );
          },
        );
      },
    );
  }
}
