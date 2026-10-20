import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Текстове поле за макетом: підпис зверху (11 sp), поле заввишки 44 dp
/// із радіусом 8 dp та рамкою 1 dp.
///
/// Віджет не має власного стану й не створює [TextEditingController]:
/// початкове значення задається через [initialValue], а поточним текстом
/// керує вбудований [TextFormField].
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.initialValue,
    this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
  });

  final String label;
  final String? initialValue;
  final String? hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.xs,
      children: [
        Text(label, style: AppTextStyles.caption),
        TextFormField(
          initialValue: initialValue,
          obscureText: obscureText,
          autocorrect: !obscureText,
          enableSuggestions: !obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          minLines: maxLines,
          maxLines: maxLines,
          style: AppTextStyles.input,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: AppColors.background,
            hintText: hint,
            hintStyle: AppTextStyles.input.copyWith(
              color: AppColors.textSecondary,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 13,
            ),
            border: _border(AppColors.border, 1),
            enabledBorder: _border(AppColors.border, 1),
            focusedBorder: _border(AppColors.primary, 2),
          ),
        ),
      ],
    );
  }

  static OutlineInputBorder _border(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.field),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}