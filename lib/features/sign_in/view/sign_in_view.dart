import 'package:flutter/material.dart';
import 'package:islamic_ai/app/app.dart';
import 'package:islamic_ai/common/widgets/widgets.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                  'Sign In',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: IAIColor.deepBlue,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '''Welcome! Please sign in to access your account and continue using our app.''',
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
                    const SizedBox(
                      width: 200,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.forgotPassword),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: IAIColor.subTitle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Log In',
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(Routes.home),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(Routes.signUp),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: IAIColor.separator),
                        ),
                        TextSpan(
                          text: 'Sign Up',
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
