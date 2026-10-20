import 'package:flutter/material.dart';

import '../../core/constants/app_dimens.dart';
import '../../core/utils/formatters.dart';
import '../../core/utils/ui_utils.dart';
import '../../core/widgets/widgets.dart';
import '../../data/mock_data.dart';
import '../../data/models/task.dart';

/// Екран «Нове завдання» (макет 04_taskform).
///
/// Якщо передано [task], екран працює в режимі редагування.
/// Стан екрана — лише обрані значення полів вибору; текстові поля
/// отримують початкові значення через `initialValue`.
class TaskFormScreen extends StatefulWidget {
  const TaskFormScreen({super.key, this.task});

  final Task? task;

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  String? _category;
  String? _assignee;
  DateTime? _dueDate;
  late TaskPriority _priority;
  late TaskRepeat _repeat;

  bool get _isEditing => widget.task != null;

  @override
  void initState() {
    super.initState();
    final task = widget.task;
    _category = task?.category;
    _assignee = task?.assignee;
    _dueDate = task?.dueDate;
    _priority = task?.priority ?? TaskPriority.medium;
    _repeat = task?.repeat ?? TaskRepeat.none;
  }

  Future<void> _pickCategory() async {
    final value = await showOptionsSheet<String>(
      context,
      title: 'Категорія',
      options: MockData.categories,
      labelOf: (category) => category,
      selected: _category,
    );
    if (value != null && mounted) setState(() => _category = value);
  }

  Future<void> _pickAssignee() async {
    final value = await showOptionsSheet<String>(
      context,
      title: 'Виконавець',
      options: [for (final member in MockData.members) member.name],
      labelOf: (name) => name,
      selected: _assignee,
    );
    if (value != null && mounted) setState(() => _assignee = value);
  }

  /// Вікно з варіантами повторення завдання: щодня, через день,
  /// щотижня, щомісяця (рекомендація викладача №4).
  Future<void> _pickRepeat() async {
    final value = await showOptionsSheet<TaskRepeat>(
      context,
      title: 'Повторювати завдання',
      options: TaskRepeat.values,
      labelOf: (repeat) => repeat.label,
      selected: _repeat,
    );
    if (value != null && mounted) setState(() => _repeat = value);
  }

  /// Вибір дати та часу виконання системними діалогами.
  Future<void> _pickDeadline() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 19, minute: 0),
    );
    if (time == null || !mounted) return;

    setState(() {
      _dueDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  /// Без бізнес-логіки: дані не зберігаються, лише повідомлення.
  void _save() {
    showAppMessage(
      context,
      _isEditing ? 'Зміни збережено (демо)' : 'Завдання створено (демо)',
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    final dueDate = _dueDate;

    return Scaffold(
      appBar: AppTopBar(
        title: _isEditing ? 'Редагування завдання' : 'Нове завдання',
        leading: IconButton(
          tooltip: 'Закрити',
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.l,
          children: [
            AppTextField(
              label: 'Назва завдання',
              initialValue: task?.title,
              textInputAction: TextInputAction.next,
            ),
            AppTextField(
              label: 'Опис',
              initialValue: task?.description,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
            AppPickerField(
              label: 'Категорія',
              value: _category,
              placeholder: 'Оберіть категорію',
              onTap: _pickCategory,
            ),
            AppPickerField(
              label: 'Виконавець',
              value: _assignee,
              placeholder: 'Оберіть виконавця',
              onTap: _pickAssignee,
            ),
            AppPickerField(
              label: 'Строк виконання',
              value: dueDate == null ? null : formatDateTime(dueDate),
              placeholder: 'Оберіть дату й час',
              onTap: _pickDeadline,
            ),
            Row(
              spacing: AppSpacing.s,
              children: [
                for (final priority in TaskPriority.values)
                  AppChoiceChip(
                    label: priority.label,
                    selected: priority == _priority,
                    onTap: () => setState(() => _priority = priority),
                  ),
              ],
            ),
            // Активне поле замість підпису-«заглушки»: натискання
            // відкриває вікно з варіантами повторення.
            AppPickerField(
              label: 'Повторювати завдання',
              value: _repeat.label,
              icon: Icons.repeat,
              onTap: _pickRepeat,
            ),
            PrimaryButton(label: 'Зберегти', onPressed: _save),
          ],
        ),
      ),
    );
  }
}