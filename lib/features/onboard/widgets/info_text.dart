import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color = IAIColor.textGray,
  });
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
          ),
    );
  }
}
