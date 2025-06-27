import 'package:intl/intl.dart';

String datetimeToString(int timeStamp) {
  final dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);
  final DateFormat formatter = DateFormat('MMMM d y');
  return formatter.format(dateTime);
}