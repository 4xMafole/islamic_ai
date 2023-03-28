import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.logoSize,
    required this.nameSize,
  });

  final double logoSize;
  final double nameSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/app_icon.svg',
          width: logoSize,
          height: logoSize,
        ),
        const SizedBox(width: 16),
        Text(
          'Islamic Ai',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: nameSize,
            color: IAIColor.deepBlue,
          ),
        ),
      ],
    );
  }
}
