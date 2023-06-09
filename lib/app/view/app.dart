import 'package:flutter/material.dart';
import 'package:islamic_ai/app/app.dart';
import 'package:islamic_ai/features/theme/theme.dart';
import 'package:islamic_ai/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: IAITheme.darkTheme(),
      theme: IAITheme.lightTheme(),
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: Routes.splash,
      onGenerateRoute: Routes.onGenerateRouted,
    );
  }
}
