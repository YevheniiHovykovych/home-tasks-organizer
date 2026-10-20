import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Показує коротке повідомлення (SnackBar) унизу екрана.
///
/// Використовується замість реальної бізнес-логіки: повідомляє,
/// що дія виконана в демонстраційному режимі.
void showAppMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}

/// Показує нижню панель із переліком варіантів і повертає обраний.
///
/// Обраний на цей момент варіант [selected] позначається галочкою.
/// Якщо користувач закрив панель без вибору, повертається `null`.
Future<T?> showOptionsSheet<T>(
  BuildContext context, {
  required String title,
  required List<T> options,
  required String Function(T option) labelOf,
  T? selected,
}) {
  return showModalBottomSheet<T>(
    context: context,
    showDragHandle: true,
    builder: (sheetContext) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.l,
              0,
              AppSpacing.l,
              AppSpacing.s,
            ),
            child: Text(title, style: AppTextStyles.subtitle),
          ),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (final option in options)
                  ListTile(
                    title: Text(labelOf(option)),
                    trailing: option == selected
                        ? const Icon(Icons.check, color: AppColors.primary)
                        : null,
                    onTap: () => Navigator.of(sheetContext).pop(option),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}