import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/widgets.dart';
import '../../data/mock_data.dart';
import '../tasks/task_details_screen.dart';

/// Головний екран (макет 03_home): статистика та найближчі завдання.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onOpenProfile});

  /// Перехід на вкладку «Профіль» (іконка в правому куті панелі).
  final VoidCallback onOpenProfile;

  @override
  Widget build(BuildContext context) {
    // Без бізнес-логіки: беремо перші три завдання з тестових даних.
    final nearestTasks = MockData.tasks.take(3);

    return Scaffold(
      appBar: AppTopBar(
        title: MockData.householdName,
        actions: [
          IconButton(
            tooltip: 'Профіль',
            icon: const Icon(Icons.person),
            onPressed: onOpenProfile,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.l,
          AppSpacing.l,
          AppSpacing.l,
          AppSpacing.fabSafeBottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.l,
          children: [
            const Row(
              spacing: AppSpacing.s,
              children: [
                StatTile(
                  value: MockData.activeCount,
                  label: 'Активні',
                  color: AppColors.blue,
                ),
                StatTile(
                  value: MockData.doneCount,
                  label: 'Виконано',
                  color: AppColors.green,
                ),
                StatTile(
                  value: MockData.overdueCount,
                  label: 'Прострочено',
                  color: AppColors.red,
                ),
              ],
            ),
            const Text('Найближчі завдання', style: AppTextStyles.subtitle),
            for (final task in nearestTasks)
              TaskCard(
                task: task,
                onTap: () => TaskDetailsScreen.open(context, task),
              ),
          ],
        ),
      ),
    );
  }
}