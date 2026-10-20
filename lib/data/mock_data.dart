import 'models/member.dart';
import 'models/task.dart';

/// Тестові (hardcoded) дані замість запитів до сервера.
///
/// Бізнес-логіку не реалізовано: усі екрани беруть дані звідси.
class MockData {
  MockData._();

  static const String userName = 'Говикович Євгеній';
  static const String userFirstName = 'Євгеній';
  static const String userEmail = 'user@example.com';

  static const String householdName = 'Дім Ковальських';
  static const String inviteCode = 'A7K9-QX2';

  // Зведена статистика головного екрана (значення з макета).
  static const int activeCount = 5;
  static const int doneCount = 12;
  static const int overdueCount = 1;

  static const List<String> categories = [
    'Кухня',
    'Прибирання',
    'Покупки',
    'Рослини',
    'Ремонт',
  ];

  static const List<Member> members = [
    Member(name: 'Євгеній', isAdmin: true),
    Member(name: 'Олена'),
    Member(name: 'Богдан'),
    Member(name: 'Ірина'),
  ];

  static final List<Task> tasks = [
    Task(
      id: '1',
      title: 'Помити посуд',
      description: 'Після вечері помити весь посуд і витерти стіл.',
      category: 'Кухня',
      assignee: 'Олена',
      dueDate: _at(0, 19, 0),
      repeat: TaskRepeat.daily,
    ),
    Task(
      id: '2',
      title: 'Винести сміття',
      description: 'Винести пакети з кухні та з ванної кімнати.',
      category: 'Прибирання',
      assignee: 'Богдан',
      dueDate: _at(0, 21, 0),
      status: TaskStatus.inProgress,
    ),
    Task(
      id: '3',
      title: 'Прибрати кухню',
      description: 'Протерти поверхні, плиту та підлогу.',
      category: 'Кухня',
      assignee: 'Ірина',
      dueDate: _at(-1, 20, 0),
      status: TaskStatus.overdue,
      priority: TaskPriority.high,
    ),
    Task(
      id: '4',
      title: 'Полити квіти',
      description: 'Полити кімнатні рослини у вітальні.',
      category: 'Рослини',
      assignee: 'Олена',
      dueDate: _at(1, 9, 0),
      status: TaskStatus.done,
      priority: TaskPriority.low,
      repeat: TaskRepeat.weekly,
    ),
    Task(
      id: '5',
      title: 'Скласти білизну',
      description: 'Розкласти випрану білизну по шафах.',
      category: 'Прибирання',
      assignee: 'Євгеній',
      dueDate: _at(1, 18, 0),
    ),
    Task(
      id: '6',
      title: 'Купити продукти',
      description: 'Хліб, молоко, овочі та засіб для миття посуду.',
      category: 'Покупки',
      assignee: 'Євгеній',
      dueDate: _at(2, 17, 30),
      priority: TaskPriority.high,
    ),
  ];

  /// Дата відносно сьогодні: [dayOffset] днів, [hour]:[minute].
  static DateTime _at(int dayOffset, int hour, int minute) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day + dayOffset, hour, minute);
  }
}