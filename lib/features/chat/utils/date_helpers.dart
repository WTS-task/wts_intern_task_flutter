extension DateTimeHelper on DateTime {
  bool isSameDay(DateTime sameDate) {
    return DateTime(year, month, day) ==
        DateTime(sameDate.year, sameDate.month, sameDate.day);
  }
}

String formatDateSeparator(int? ms) {
  if (ms == null) return '';
  final date = DateTime.fromMillisecondsSinceEpoch(ms);
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final dateToCompare = DateTime(date.year, date.month, date.day);

  if (dateToCompare == today) {
    return 'Сегодня ${date.day}.${date.month}';
  } else if (dateToCompare == yesterday) {
    return 'Вчера ${date.day}.${date.month}';
  } else {
    return '${date.day}.${date.month}.${date.year}';
  }
}