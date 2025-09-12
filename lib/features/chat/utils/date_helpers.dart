import 'package:intl/intl.dart';

extension DateTimeHelper on DateTime {
  bool isSameDay(DateTime sameDate) {
    return DateTime(
      year,
      month,
      day,
    ).isAtSameMomentAs(DateTime(sameDate.year, sameDate.month, sameDate.day));
  }

  String formattedWithFormat(String format) {
    final formatter = DateFormat(format);
    return formatter.format(this);
  }

  String formatTime() {
    return formattedWithFormat('HH:mm');
  }

  String formatDate() {
    return formattedWithFormat('dd.MM.yyyy');
  }
}
