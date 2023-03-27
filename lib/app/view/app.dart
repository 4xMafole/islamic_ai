import 'package:flutter/material.dart';
import 'package:islamic_ai/features/onboard/onboard.dart';
import 'package:islamic_ai/features/theme/theme.dart';
import 'package:islamic_ai/l10n/l10n.dart';
import 'package:islamic_ai/features/splash/splash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: IAITheme.darkTheme(),
      theme: IAITheme.lightTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const OnBoardView(),
    );
  }
}
