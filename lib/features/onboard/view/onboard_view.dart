import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IAIColor.primaryBackground,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/rocket.png'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ask Islamic Ai',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: IAIColor.whiteColor,
                    ),
                  ),
                  Image.asset(
                    'assets/images/perfect.png',
                    color: Colors.transparent,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'any question',
                    style: TextStyle(
                      fontSize: 24,
                      color: IAIColor.textBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset('assets/images/perfect.png'),
                ],
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Islamic Ai will provide answers based on authentic Islamic books, and will provide '
                  'references. Please note, this is for Reference ONLY, not Fatwah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: IAIColor.textGray,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child: SizedBox()),
                    Container(
                      height: 4,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: IAIColor.progressBarActive,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 4,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: IAIColor.progressBarInactive,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    const Text(
                      'Next',
                      style: TextStyle(
                        color: IAIColor.textGray,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
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
