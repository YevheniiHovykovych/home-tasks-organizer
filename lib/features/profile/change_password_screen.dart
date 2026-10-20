import 'package:flutter/material.dart';

import '../../core/constants/app_dimens.dart';
import '../../core/utils/ui_utils.dart';
import '../../core/widgets/widgets.dart';

/// Екран «Зміна пароля» (відкривається кнопкою «Змінити пароль» у профілі).
///
/// У макеті немає окремого екрана, його додано відповідно до вимоги
/// методичних вказівок (п. 3.2).
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  /// Без бізнес-логіки: пароль не змінюється, лише повідомлення.
  void _save(BuildContext context) {
    showAppMessage(context, 'Пароль змінено (демо)');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Зміна пароля', showBack: true),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.l,
          children: [
            const AppTextField(
              label: 'Поточний пароль',
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            const AppTextField(
              label: 'Новий пароль',
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            const AppTextField(
              label: 'Підтвердження нового пароля',
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            PrimaryButton(
              label: 'Зберегти пароль',
              onPressed: () => _save(context),
            ),
          ],
        ),
      ),
    );
  }
}