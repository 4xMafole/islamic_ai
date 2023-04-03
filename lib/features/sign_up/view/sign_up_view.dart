import 'package:flutter/material.dart';
import 'package:islamic_ai/app/app.dart';
import 'package:islamic_ai/common/widgets/widgets.dart';
import 'package:islamic_ai/features/sign_up/widgets/widgets.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Hero(
                  tag: 'icon_container',
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: IAIColor.tabBarInactive,
                    ),
                    child: Center(
                      child: Image.asset('assets/images/clap.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: IAIColor.deepBlue,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '''Sign up for our app and start enjoying all the features and benefits today!''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: IAIColor.subTitle,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SignInOption(
                      assetPath: 'assets/icons/apple.svg',
                      text: 'Apple',
                      bgColor: IAIColor.containerBackground,
                    ),
                    SizedBox(width: 16),
                    SignInOption(
                      assetPath: 'assets/icons/google.svg',
                      text: 'Google',
                      bgColor: IAIColor.containerBackground,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SeparatorLine(),
                    SizedBox(width: 8),
                    Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: IAIColor.separator,
                      ),
                    ),
                    SizedBox(width: 8),
                    SeparatorLine(),
                  ],
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                  hintText: 'Name',
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                  hintText: 'Password',
                  inputType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ToggleButton(),
                    const SizedBox(width: 8),
                    Flexible(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(color: IAIColor.separator),
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(color: IAIColor.termsHighlight),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(color: IAIColor.separator),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(color: IAIColor.termsHighlight),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Create Account',
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(Routes.home),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: IAIColor.separator),
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(color: IAIColor.deepBlue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
