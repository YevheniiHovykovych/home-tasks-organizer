import 'package:flutter/material.dart';

import '../../core/constants/app_dimens.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/ui_utils.dart';
import '../../core/widgets/widgets.dart';

/// Екран «Відновлення пароля» через електронну пошту.
///
/// У макеті є лише посилання «Забули пароль?», тому екран додано
/// відповідно до вимоги методичних вказівок (п. 3.1).
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  /// Без бізнес-логіки: лист не надсилається, лише показується повідомлення.
  void _send(BuildContext context) {
    showAppMessage(context, 'Посилання для відновлення надіслано (демо)');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Відновлення пароля', showBack: true),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.l,
          children: [
            const Text(
              'Вкажіть електронну пошту — ми надішлемо посилання '
              'для встановлення нового пароля.',
              style: AppTextStyles.lead,
            ),
            const AppTextField(
              label: 'Електронна пошта',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
            ),
            PrimaryButton(
              label: 'Надіслати посилання',
              onPressed: () => _send(context),
            ),
          ],
        ),
      ),
    );
  }
}