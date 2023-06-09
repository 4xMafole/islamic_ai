import 'package:flutter/material.dart';
import 'package:islamic_ai/app/app.dart';
import 'package:islamic_ai/features/onboard/widgets/widgets.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: IAIColor.primaryBackground,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AssetImagePath(assetPath: 'assets/images/rocket.png'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  HeaderText(text: 'Ask Islamic Ai'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  HeaderText(
                    text: 'any question',
                    // color: IAIColor.textBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: InfoText(
                  text: '''
Islamic Ai will provide answers based on authentic Islamic books, and will provide 
                      references. Please note, this is for Reference ONLY, not Fatwah''',
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(Routes.signIn),
                      child: const InfoText(
                        text: 'Get Started',
                        color: IAIColor.tabBarActive,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
