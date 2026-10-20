import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/ui_utils.dart';
import '../../core/widgets/widgets.dart';
import '../../data/mock_data.dart';
import 'create_household_screen.dart';
import 'join_household_screen.dart';

/// Екран «Домогосподарство» (макет 08_household).
///
/// Має два стани: якщо [hasHousehold] — код запрошення та список учасників,
/// інакше — пропозиція створити домогосподарство або приєднатися за кодом.
class HouseholdScreen extends StatelessWidget {
  const HouseholdScreen({super.key, this.hasHousehold = true});

  final bool hasHousehold;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Домогосподарство'),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: hasHousehold ? const _HouseholdInfo() : const _NoHousehold(),
      ),
    );
  }
}

/// Стан «домогосподарство є»: код запрошення та учасники.
class _HouseholdInfo extends StatelessWidget {
  const _HouseholdInfo();

  /// «Поділитися»: копіює код запрошення до буфера обміну.
  Future<void> _copyCode(BuildContext context) async {
    await Clipboard.setData(const ClipboardData(text: MockData.inviteCode));
    if (!context.mounted) return;
    showAppMessage(context, 'Код запрошення скопійовано');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.l,
      children: [
        _InviteCodeCard(onShare: () => _copyCode(context)),
        Text(
          'Учасники (${MockData.members.length})',
          style: AppTextStyles.subtitle,
        ),
        for (final member in MockData.members)
          Row(
            spacing: 10,
            children: [
              const UserAvatar(size: 32),
              Text(member.displayName, style: AppTextStyles.member),
            ],
          ),
        SecondaryButton(
          label: 'Запросити учасника',
          onPressed: () => showAppMessage(
            context,
            'Передайте учаснику код ${MockData.inviteCode}',
          ),
        ),
      ],
    );
  }
}

/// Стан «домогосподарства ще немає»: створити власне або приєднатися.
class _NoHousehold extends StatelessWidget {
  const _NoHousehold();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.l,
      children: [
        const SizedBox(height: AppSpacing.l),
        const Icon(Icons.home_outlined, size: 72, color: AppColors.primary),
        const Text(
          'У вас ще немає домогосподарства',
          textAlign: TextAlign.center,
          style: AppTextStyles.heading,
        ),
        const Text(
          'Створіть власне домогосподарство та запросіть до нього '
          'учасників або приєднайтеся до наявного за кодом запрошення.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMuted,
        ),
        PrimaryButton(
          label: 'Створити домогосподарство',
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const CreateHouseholdScreen(),
            ),
          ),
        ),
        SecondaryButton(
          label: 'Приєднатися за кодом',
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const JoinHouseholdScreen(),
            ),
          ),
        ),
      ],
    );
  }
}

/// Картка з кодом запрошення та кнопкою «Поділитися».
class _InviteCodeCard extends StatelessWidget {
  const _InviteCodeCard({required this.onShare});

  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.m,
        children: [
          Text(
            MockData.inviteCode,
            style: AppTextStyles.heading.copyWith(color: AppColors.primary),
          ),
          PrimaryButton(label: 'Поділитися', onPressed: onShare),
        ],
      ),
    );
  }
}