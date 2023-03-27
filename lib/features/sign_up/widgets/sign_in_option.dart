import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInOption extends StatelessWidget {

  const SignInOption({
    super.key,
    required this.assetPath,
    required this.text,
    required this.bgColor,
  });
  final String assetPath;
  final String text;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(assetPath),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
