/// Додає ведучий нуль до числа: 7 -> "07".
String twoDigits(int value) => value.toString().padLeft(2, '0');

/// Час у форматі «19:00».
String formatTime(DateTime date) =>
    '${twoDigits(date.hour)}:${twoDigits(date.minute)}';

/// Дата у форматі «12.10.2026».
String formatDate(DateTime date) =>
    '${twoDigits(date.day)}.${twoDigits(date.month)}.${date.year}';

/// Дата й час у форматі «12.10.2026, 19:00».
String formatDateTime(DateTime date) =>
    '${formatDate(date)}, ${formatTime(date)}';