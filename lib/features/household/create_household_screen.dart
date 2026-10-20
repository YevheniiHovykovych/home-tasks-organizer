import 'package:flutter/material.dart';

import '../../core/constants/app_dimens.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/ui_utils.dart';
import '../../core/widgets/widgets.dart';
import '../shell/main_shell.dart';

/// Екран «Нове домогосподарство»: створення власного домогосподарства
/// (рекомендація викладача №1 до макетів лабораторної роботи № 2).
class CreateHouseholdScreen extends StatelessWidget {
  const CreateHouseholdScreen({super.key});

  /// Без бізнес-логіки: «створення» лише відкриває головний екран.
  void _create(BuildContext context) {
    showAppMessage(context, 'Домогосподарство створено (демо)');
    MainShell.open(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Нове домогосподарство', showBack: true),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.l,
          children: [
            const Text(
              'Вкажіть назву. Після створення застосунок згенерує код '
              'запрошення для інших учасників.',
              style: AppTextStyles.lead,
            ),
            const AppTextField(
              label: 'Назва домогосподарства',
              hint: 'Наприклад, Дім Ковальських',
              textInputAction: TextInputAction.done,
            ),
            PrimaryButton(label: 'Створити', onPressed: () => _create(context)),
          ],
        ),
      ),
    );
  }
}