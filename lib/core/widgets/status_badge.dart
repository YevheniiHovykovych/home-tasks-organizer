import 'package:flutter/material.dart';

import '../../data/models/task.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Колір для кожного статусу завдання.
extension TaskStatusColor on TaskStatus {
  Color get color {
    return switch (this) {
      TaskStatus.planned => AppColors.blue,
      TaskStatus.inProgress => AppColors.amber,
      TaskStatus.done => AppColors.green,
      TaskStatus.overdue => AppColors.red,
    };
  }
}

/// Кольоровий бейдж зі статусом завдання («Заплановано», «Виконано»...).
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status});

  final TaskStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: BorderRadius.circular(AppRadius.badge),
      ),
      child: Text(status.label, style: AppTextStyles.badge),
    );
  }
}