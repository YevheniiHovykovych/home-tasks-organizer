import '../../core/utils/formatters.dart';

/// Статус виконання побутового завдання.
enum TaskStatus {
  planned('Заплановано'),
  inProgress('Виконується'),
  done('Виконано'),
  overdue('Прострочено');

  const TaskStatus(this.label);

  final String label;
}

/// Пріоритет завдання.
enum TaskPriority {
  low('Низький'),
  medium('Середній'),
  high('Високий');

  const TaskPriority(this.label);

  final String label;
}

/// Періодичність повторення завдання (вікно вибору на формі завдання).
enum TaskRepeat {
  none('Не повторювати'),
  daily('Щодня'),
  everyOtherDay('Через день'),
  weekly('Щотижня'),
  monthly('Щомісяця');

  const TaskRepeat(this.label);

  final String label;
}

/// Модель побутового завдання.
class Task {
  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.assignee,
    required this.dueDate,
    this.status = TaskStatus.planned,
    this.priority = TaskPriority.medium,
    this.repeat = TaskRepeat.none,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final String assignee;
  final DateTime dueDate;
  final TaskStatus status;
  final TaskPriority priority;
  final TaskRepeat repeat;

  /// Кількість днів від сьогодні до строку (-1 — вчора, 1 — завтра).
  int get _daysFromToday {
    final now = DateTime.now();
    final today = DateTime.utc(now.year, now.month, now.day);
    final due = DateTime.utc(dueDate.year, dueDate.month, dueDate.day);
    return due.difference(today).inDays;
  }

  String get _dayLabel {
    return switch (_daysFromToday) {
      -1 => 'вчора',
      0 => 'сьогодні',
      1 => 'завтра',
      _ => formatDate(dueDate),
    };
  }

  /// Короткий підпис строку для картки: «сьогодні 19:00», «вчора».
  String get dueShort {
    return _daysFromToday == 0
        ? '$_dayLabel ${formatTime(dueDate)}'
        : _dayLabel;
  }

  /// Повний підпис строку для екрана деталей: «сьогодні, 19:00».
  String get dueFull => '$_dayLabel, ${formatTime(dueDate)}';
}