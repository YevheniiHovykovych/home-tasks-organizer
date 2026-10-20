import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Плитка статистики на головному екрані («5 Активні»).
class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.value,
    required this.label,
    required this.color,
  });

  final int value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.stat),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 2,
        children: [
          Text('$value', style: AppTextStyles.heading.copyWith(color: color)),
          Text(label, style: AppTextStyles.captionSmall),
        ],
      ),
    );
  }
}