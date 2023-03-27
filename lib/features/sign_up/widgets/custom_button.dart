import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: IAIColor.termsHighlight,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 15),
            spreadRadius: -20,
            blurRadius: 60,
            color: IAIColor.termsHighlight,
          )
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: IAIColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
