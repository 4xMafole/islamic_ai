import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.text,
    this.color = IAIColor.whiteColor,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w600,
  });
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).primaryTextTheme.titleMedium!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: IAIColor.deepBlue,
            // color: color,
          ),
    );
  }
}
