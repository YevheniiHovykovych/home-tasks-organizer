import 'package:flutter/material.dart';

import '../../data/models/task.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';
import '../theme/app_text_styles.dart';
import 'status_badge.dart';

/// Картка побутового завдання для списків (головний екран, список завдань).
class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task, this.onTap});

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      elevation: 2,
      shadowColor: AppColors.shadow,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
        side: const BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              // Висота рядка 100 dp — як у макеті Figma.
              SizedBox(
                height: 100,
                child: Row(
                  spacing: AppSpacing.s,
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.subtitle,
                      ),
                    ),
                    StatusBadge(status: task.status),
                  ],
                ),
              ),
              Text(
                '${task.assignee}  •  до ${task.dueShort}',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}