import 'package:wts_task/core/entities/api_response.dart';

class BaseApiResponse {
  BaseApiResponse({this.meta, this.rawData, this.error, this.dataJson});

  Meta? meta;
  String? rawData;
  String? error;
  dynamic dataJson;

  bool get isError => error?.isNotEmpty ?? false;
}
