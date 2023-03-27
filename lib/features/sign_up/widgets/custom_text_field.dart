import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.inputType,
    this.isPassword = false,
  });
  final String hintText;
  final TextInputType inputType;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final obscureText = isPassword;
    return Container(
      width: 345,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: IAIColor.containerBackground,
      ),
      child: Center(
        child: TextField(
          keyboardType: inputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {},
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
