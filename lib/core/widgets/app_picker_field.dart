import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Поле вибору значення: виглядає як [AppTextField], але натискання
/// відкриває список варіантів, а не клавіатуру.
///
/// Стрілка праворуч (і необов'язкова піктограма [icon] ліворуч) підказує,
/// що поле інтерактивне. Віджет без власного стану: обране значення
/// ([value]) зберігає батьківський екран.
class AppPickerField extends StatelessWidget {
  const AppPickerField({
    super.key,
    required this.label,
    required this.onTap,
    this.value,
    this.placeholder = 'Оберіть значення',
    this.icon,
  });

  final String label;
  final VoidCallback onTap;

  /// Обране значення; якщо `null` — показується [placeholder].
  final String? value;
  final String placeholder;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final text = value ?? '';
    final hasValue = text.isNotEmpty;
    final radius = BorderRadius.circular(AppRadius.field);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.xs,
      children: [
        Text(label, style: AppTextStyles.caption),
        Semantics(
          button: true,
          child: Material(
            color: AppColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: radius,
              side: const BorderSide(color: AppColors.border),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: radius,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Row(
                  spacing: AppSpacing.s,
                  children: [
                    if (icon != null)
                      Icon(icon, size: 20, color: AppColors.primary),
                    Expanded(
                      child: Text(
                        hasValue ? text : placeholder,
                        style: AppTextStyles.input.copyWith(
                          color: hasValue
                              ? AppColors.textPrimary
                              : AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}