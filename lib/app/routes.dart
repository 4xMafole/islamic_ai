import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islamic_ai/features/answer/answer.dart';
import 'package:islamic_ai/features/forget_password/forget_password.dart';
import 'package:islamic_ai/features/home/home.dart';
import 'package:islamic_ai/features/onboard/onboard.dart';
import 'package:islamic_ai/features/profile/profile.dart';
import 'package:islamic_ai/features/settings/settings.dart';
import 'package:islamic_ai/features/share/share.dart';
import 'package:islamic_ai/features/sign_in/sign_in.dart';
import 'package:islamic_ai/features/sign_up/sign_up.dart';
import 'package:islamic_ai/features/splash/splash.dart';

class Routes {
  static const home = '/';
  static const splash = 'splash';
  static const onboard = 'onboard';
  static const signUp = 'signUp';
  static const signIn = 'signIn';
  static const answer = '/answer';
  static const forgotPassword = '/forgotPassword';
  static const editProfile = '/editProfile';
  static const termsCondition = '/termsCondition';
  static const helpSupport = '/helpSupport';
  static const feedback = '/feedback';
  static const share = '/share';

  static String currentRoute = splash;

  static Route<dynamic> onGenerateRouted(RouteSettings routeSettings) {
    currentRoute = routeSettings.name ?? '';
    log('Current Route:: $currentRoute');

    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case onboard:
        return MaterialPageRoute(builder: (context) => const OnBoardView());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case signIn:
        return MaterialPageRoute(builder: (context) => const SignInView());
      case answer:
        return MaterialPageRoute(builder: (context) => const AnswerView());
      case forgotPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordView());
      case editProfile:
        return MaterialPageRoute(builder: (context) => const EditProfileView());
      case termsCondition:
        return MaterialPageRoute(builder: (context) => const AgreementView());
      case helpSupport:
        return MaterialPageRoute(builder: (context) => const AgreementView());
      case feedback:
        return MaterialPageRoute(builder: (context) => const FeedbackView());
      case share:
        return MaterialPageRoute(builder: (context) => const ShareView());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
