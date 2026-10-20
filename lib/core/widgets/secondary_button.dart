import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Допоміжна кнопка: білий фон, рамка primary 2 dp, форма «таблетка».
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.surface,
        foregroundColor: color,
        elevation: 2,
        shadowColor: AppColors.shadow,
        side: BorderSide(color: color, width: 2),
        padding: const EdgeInsets.all(14),
        minimumSize: const Size(0, 44),
        shape: const StadiumBorder(),
        textStyle: AppTextStyles.button,
      ),
      child: Text(label),
    );
  }
}