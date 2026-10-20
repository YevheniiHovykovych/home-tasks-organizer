import 'package:flutter/material.dart';

import '../../core/constants/app_dimens.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/widgets.dart';
import '../shell/main_shell.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart';

/// Екран «Вхід» (макет 02_login).
///
/// Без власного стану: значення полів поки що ніде не використовуються.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _openForgotPassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const ForgotPasswordScreen()),
    );
  }

  void _openRegister(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Вхід'),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.l,
          children: [
            const AppTextField(
              label: 'Електронна пошта',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const AppTextField(
              label: 'Пароль',
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            // Без бізнес-логіки: «Увійти» одразу відкриває головний екран.
            PrimaryButton(
              label: 'Увійти',
              onPressed: () => MainShell.open(context),
            ),
            AppTextLink(
              label: 'Забули пароль?',
              onTap: () => _openForgotPassword(context),
            ),
            const Text('— або —', style: AppTextStyles.caption),
            SecondaryButton(
              label: 'Зареєструватися',
              onPressed: () => _openRegister(context),
            ),
          ],
        ),
      ),
    );
  }
}