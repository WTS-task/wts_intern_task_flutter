import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeJsonConverter implements JsonConverter<DateTime, int> {
  const DateTimeJsonConverter();

  @override
  DateTime fromJson(int json) {
    final result = DateTime.fromMillisecondsSinceEpoch(json * 1000);
    return result;
  }

  @override
  int toJson(DateTime object) => (object.millisecondsSinceEpoch) ~/ 1000;
}