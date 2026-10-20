import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Основна кнопка підтвердження дії: заливка primary, форма «таблетка».
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        shadowColor: AppColors.shadow,
        padding: const EdgeInsets.all(14),
        minimumSize: const Size(0, 44),
        shape: const StadiumBorder(),
        textStyle: AppTextStyles.button,
      ),
      child: Text(label),
    );
  }
}