import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/app_icon.svg',
              color: const Color(0xFF42A5F5),
            ),
            const SizedBox(height: 20),
            const Text(
              'Islamic Ai',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: IAIColor.deepBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
