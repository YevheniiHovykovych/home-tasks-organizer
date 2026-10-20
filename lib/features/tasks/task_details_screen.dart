import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/widgets.dart';
import '../../data/models/task.dart';
import 'task_form_screen.dart';

/// Екран «Деталі завдання» (макет 05_taskdetails).
///
/// Дії «Редагувати» та «Видалити» доступні лише через підписані кнопки
/// під описом завдання; дублювання піктограмами у верхній панелі прибрано
/// (рекомендація викладача №3).
class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.task});

  final Task task;

  /// Відкриває екран деталей поверх поточного.
  static Future<void> open(BuildContext context, Task task) {
    return Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => TaskDetailsScreen(task: task)),
    );
  }

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  /// Статуси, які користувач може вибрати вручну.
  static const List<TaskStatus> _selectable = [
    TaskStatus.planned,
    TaskStatus.inProgress,
    TaskStatus.done,
  ];

  late TaskStatus _status;

  @override
  void initState() {
    super.initState();
    _status = widget.task.status;
  }

  void _edit() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => TaskFormScreen(task: widget.task),
      ),
    );
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Видалити завдання?'),
        content: Text('Завдання «${widget.task.title}» буде видалено.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Скасувати'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text(
              'Видалити',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
    if (confirmed == true && mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;

    return Scaffold(
      // У панелі лише «Назад»: дії над завданням — у підписаних кнопках нижче.
      appBar: const AppTopBar(title: 'Деталі завдання', showBack: true),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.l,
          children: [
            Text(task.title, style: AppTextStyles.title),
            Text(task.description, style: AppTextStyles.bodyMuted),
            Text('Категорія: ${task.category}', style: AppTextStyles.body),
            Text('Виконавець: ${task.assignee}', style: AppTextStyles.body),
            Text(
              'Строк виконання: ${task.dueFull}',
              style: AppTextStyles.body,
            ),
            Text(
              'Повторення: ${task.repeat.label}',
              style: AppTextStyles.body,
            ),
            Wrap(
              spacing: 4,
              runSpacing: AppSpacing.s,
              children: [
                for (final status in _selectable)
                  AppChoiceChip(
                    label: status.label,
                    selected: status == _status,
                    onTap: () => setState(() => _status = status),
                  ),
              ],
            ),
            Row(
              spacing: AppSpacing.m,
              children: [
                Expanded(
                  child: SecondaryButton(
                    label: 'Редагувати',
                    onPressed: _edit,
                  ),
                ),
                Expanded(
                  child: SecondaryButton(
                    label: 'Видалити',
                    color: AppColors.error,
                    onPressed: _confirmDelete,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}