import 'package:freezed_annotation/freezed_annotation.dart';

class BoolJsonConverter implements JsonConverter<bool, dynamic> {
  const BoolJsonConverter();

  @override
  bool fromJson(dynamic json) {
    if (json is int) {
      return json == 1;
    } else if (json is bool) {
      return json;
    }
    throw ArgumentError('Invalid bool value: $json');
  }

  @override
  int toJson(bool object) => object ? 1 : 0;
}
