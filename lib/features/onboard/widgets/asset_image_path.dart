import 'package:flutter/material.dart';

class AssetImagePath extends StatelessWidget {
  const AssetImagePath({super.key, required this.assetPath, this.color});
  final String assetPath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      color: color,
    );
  }
}
