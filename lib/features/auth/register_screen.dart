import 'package:flutter/material.dart';

import '../../core/constants/app_dimens.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/widgets.dart';
import '../shell/main_shell.dart';

/// Текстове посилання («Забули пароль?», «Вже є акаунт? Увійти»).m
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  /// Без бізнес-логіки: після «реєстрації» відкривається вкладка «Дім»
  /// у стані «домогосподарства ще немає» (створення або приєднання),
  /// як у схемі навігації: 01 Реєстрація → 08 Домогосподарство.
  void _register(BuildContext context) {
    MainShell.open(context, initialIndex: 2, hasHousehold: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Реєстрація'),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.l,
          children: [
            const Text('Створіть обліковий запис', style: AppTextStyles.lead),
            const AppTextField(
              label: "Ім'я",
              textInputAction: TextInputAction.next,
            ),
            const AppTextField(
              label: 'Електронна пошта',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const AppTextField(
              label: 'Пароль',
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            const AppTextField(
              label: 'Підтвердження пароля',
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            PrimaryButton(
              label: 'Зареєструватися',
              onPressed: () => _register(context),
            ),
            AppTextLink(
              label: 'Вже є акаунт? Увійти',
              onTap: () => Navigator.of(context).maybePop(),
            ),
          ],
        ),
      ),
    );
  }
}