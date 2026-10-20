import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/login_screen.dart';

/// Кореневий віджет застосунку: тема, локалізація та стартовий екран.
class HomeTasksApp extends StatelessWidget {
  const HomeTasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Органайзер домашніх справ',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      // Українська локалізація стандартних діалогів (вибір дати, часу).
      locale: const Locale('uk'),
      supportedLocales: const [Locale('uk')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const LoginScreen(),
    );
  }
}