import 'package:flutter/material.dart';

import '../../core/constants/app_dimens.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/ui_utils.dart';
import '../../core/widgets/widgets.dart';
import '../../data/mock_data.dart';
import 'change_password_screen.dart';

/// Екран «Профіль» (макет 07_profile): дані користувача та заміна пароля.
///
/// Без власного стану: початкове ім'я передається в поле через
/// `initialValue`, а збереження змін поки що лише імітується.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _openChangePassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const ChangePasswordScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Профіль'),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: Column(
          spacing: AppSpacing.m,
          children: [
            const UserAvatar(size: 96),
            const Text(MockData.userName, style: AppTextStyles.heading),
            const Text(MockData.userEmail, style: AppTextStyles.bodyMuted),
            const AppTextField(
              label: "Ім'я",
              initialValue: MockData.userFirstName,
              textInputAction: TextInputAction.next,
            ),
            const AppTextField(
              label: 'Телефон',
              hint: '+380 00 000 00 00',
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
            ),
            SecondaryButton(
              label: 'Змінити пароль',
              onPressed: () => _openChangePassword(context),
            ),
            // Без бізнес-логіки: зміни не зберігаються, лише повідомлення.
            PrimaryButton(
              label: 'Зберегти зміни',
              onPressed: () =>
                  showAppMessage(context, 'Зміни профілю збережено (демо)'),
            ),
          ],
        ),
      ),
    );
  }
}