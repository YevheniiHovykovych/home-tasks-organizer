import 'package:flutter/material.dart';

import '../../core/constants/app_dimens.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/ui_utils.dart';
import '../../core/widgets/widgets.dart';
import '../../data/mock_data.dart';
import '../../data/models/task.dart';
import 'task_details_screen.dart';

/// Фільтри списку завдань.
enum TaskFilter {
  all('Усі'),
  mine('Мої'),
  overdue('Прострочені'),
  kitchen('Кухня');

  const TaskFilter(this.label);

  final String label;
}

/// Екран «Завдання» (макет 06_tasklist): фільтри та список карток.
class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  TaskFilter _filter = TaskFilter.all;

  List<Task> get _visibleTasks {
    final tasks = MockData.tasks;
    return switch (_filter) {
      TaskFilter.all => tasks,
      TaskFilter.mine =>
        tasks.where((t) => t.assignee == MockData.userFirstName).toList(),
      TaskFilter.overdue =>
        tasks.where((t) => t.status == TaskStatus.overdue).toList(),
      TaskFilter.kitchen =>
        tasks.where((t) => t.category == 'Кухня').toList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final tasks = _visibleTasks;

    return Scaffold(
      appBar: AppTopBar(
        title: 'Завдання',
        actions: [
          IconButton(
            tooltip: 'Пошук',
            icon: const Icon(Icons.search),
            onPressed: () => showAppMessage(
              context,
              'Пошук буде додано в наступних лабораторних роботах',
            ),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: AppSpacing.s,
                children: [
                  for (final filter in TaskFilter.values)
                    AppChoiceChip(
                      label: filter.label,
                      selected: filter == _filter,
                      onTap: () => setState(() => _filter = filter),
                    ),
                ],
              ),
            ),
            const Text(
              'Сортувати: за строком виконання ▾',
              style: AppTextStyles.bodyMuted,
            ),
            if (tasks.isEmpty)
              const Text(
                'Завдань за цим фільтром немає',
                style: AppTextStyles.bodyMuted,
              ),
            for (final task in tasks)
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