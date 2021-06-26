import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:notar_e_anotar_app/pages/onboarding.dart';
import 'package:notar_e_anotar_app/styles/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'Notar & Anotar',
      theme: appTheme,
      home: Onboarding(title: 'Onboarding'),
      debugShowCheckedModeBanner: false,
    );
  }
}
