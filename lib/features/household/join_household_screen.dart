import 'package:flutter/material.dart';

import '../../core/constants/app_dimens.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/ui_utils.dart';
import '../../core/widgets/widgets.dart';
import '../shell/main_shell.dart';

/// Екран «Приєднатися до домогосподарства» за кодом запрошення.
class JoinHouseholdScreen extends StatelessWidget {
  const JoinHouseholdScreen({super.key});

  /// Без бізнес-логіки: код не перевіряється, відкривається головний екран.
  void _join(BuildContext context) {
    showAppMessage(context, 'Ви приєдналися до домогосподарства (демо)');
    MainShell.open(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Приєднатися за кодом', showBack: true),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.l,
          children: [
            const Text(
              'Введіть код, який вам передав адміністратор домогосподарства.',
              style: AppTextStyles.lead,
            ),
            const AppTextField(
              label: 'Код запрошення',
              hint: 'A7K9-QX2',
              textInputAction: TextInputAction.done,
            ),
            PrimaryButton(
              label: 'Приєднатися',
              onPressed: () => _join(context),
            ),
          ],
        ),
      ),
    );
  }
}