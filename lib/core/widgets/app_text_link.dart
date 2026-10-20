import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Текстове посилання («Забули пароль?», «Видалити»).
class AppTextLink extends StatelessWidget {
  const AppTextLink({
    super.key,
    required this.label,
    required this.onTap,
    this.color = AppColors.primary,
    this.fontSize = 12,
  });

  final String label;
  final VoidCallback onTap;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          label,
          style: AppTextStyles.link.copyWith(color: color, fontSize: fontSize),
        ),
      ),
    );
  }
}