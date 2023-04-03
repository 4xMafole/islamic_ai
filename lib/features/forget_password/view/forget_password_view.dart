import 'package:flutter/material.dart';
import 'package:islamic_ai/app/app.dart';
import 'package:islamic_ai/common/widgets/app_logo.dart';
import 'package:islamic_ai/common/widgets/widgets.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconData: Icons.arrow_back,
        onPressed: () => Navigator.pop(context),
        title: const AppLogo(logoSize: 30, nameSize: 18),
      ),
      body: SafeArea(
        child: Center(
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
                        child: Image.asset('assets/images/envelope.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: IAIColor.deepBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '''Forgot your password? No worries, just enter your email address and we'll send you a link to reset it.''',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: IAIColor.subTitle,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CustomTextField(
                    hintText: 'Email address',
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: 'Continue',
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(Routes.signIn),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
