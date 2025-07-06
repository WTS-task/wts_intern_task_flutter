bool isSameDay(int? ms1, int? ms2) {
    if (ms1 == null || ms2 == null) return false;
    final date1 = DateTime.fromMillisecondsSinceEpoch(ms1);
    final date2 = DateTime.fromMillisecondsSinceEpoch(ms2);
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
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