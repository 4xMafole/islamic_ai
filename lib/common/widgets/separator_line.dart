import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class SeparatorLine extends StatelessWidget {
  const SeparatorLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 153,
        height: 1,
        color: IAIColor.textBlue,
      ),
    );
  }
}
