import 'package:flutter/material.dart';

class BoardTabBar extends StatelessWidget {
  const BoardTabBar({
    super.key,
    this.height = 4,
    this.width = 32,
    this.borderRadius = const BorderRadius.all(Radius.circular(2)),
    required this.color,
  });
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color,
      ),
    );
  }
}
