import 'dart:convert';
import 'dart:developer';

import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/entities/base_api_response.dart';

class ApiResponseParser {
  /// Парсинг списка объектов из результата выполненного запроса к API.
  static ApiResponse<List<T>> parseListFromResponse<T>(
    BaseApiResponse response, {
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
    String? emptyError,
  }) {
    try {
      if (response.isError) {
        return ApiResponse.error(
          error: response.error!,
          baseApiResponse: response,
        );
      }

      final jsonData = (response.dataJson as Map?)?[key];
      if (jsonData == null) {
        return ApiResponse.error(
          error: emptyError ?? 'Данные не найдены',
          baseApiResponse: response,
        );
      }
      final list = (jsonData as List<dynamic>).map((e) {
        if (e is Map<String, dynamic>) {
          return fromJson(e);
        } else {
          throw FormatException(
            'Ожидался Map<String, dynamic>, но получен ${e.runtimeType}',
          );
        }
      }).toList();
      return ApiResponse(result: list, baseApiResponse: response);
    } catch (e, s) {
      log('Parse list error', error: e, stackTrace: s);
      return ApiResponse.error(
        error: 'Произошла ошибка, Попробуйте позже.',
        baseApiResponse: response,
      );
    }
  }

  /// Парсинг одного объекта из результата выполненного запроса к API.
  static ApiResponse<T> parseObjectFromResponse<T>(
    BaseApiResponse response, {
    required T Function(Map<String, dynamic>) fromJson,
    String? key,
    String? emptyError,
  }) {
    try {
      if (response.isError) {
        return ApiResponse.error(
          error: response.error!,
          baseApiResponse: response,
        );
      }

      if (response.dataJson == null) {
        return ApiResponse.error(
          error: emptyError ?? 'Данные не найдены',
          baseApiResponse: response,
        );
      }

      final jsonData = (key?.isNotEmpty ?? false)
          ? (response.dataJson as Map)[key]
          : response.dataJson;
      if (jsonData == null) {
        return ApiResponse.error(
          error: emptyError ?? 'Данные не найдены',
          baseApiResponse: response,
        );
      }
      final object = fromJson(jsonData as Map<String, dynamic>);
      return ApiResponse(result: object, baseApiResponse: response);
    } catch (e, s) {
      log('Parse list error', error: e, stackTrace: s);
      return ApiResponse.error(
        error: 'Произошла ошибка, Попробуйте позже.',
        baseApiResponse: response,
      );
    }
  }

  static BaseApiResponse _parseBody(String? body) {
    if (body == null) {
      return BaseApiResponse(error: 'Bad Request Format', rawData: body);
    }
    final dynamic responseJson = json.decode(body);
    if (responseJson is! Map<String, dynamic>) {
      return BaseApiResponse(
        error: 'Response is nod valid json',
        rawData: body,
      );
    }
    final dataJson = responseJson['data'];
    final metaJson = responseJson['meta'];
    if (metaJson == null) {
      return BaseApiResponse(
        error: 'Не удалось получить meta часть запроса',
        rawData: body,
      );
    }
    if (dataJson == null) {
      return BaseApiResponse(
        error: 'Не удалось получить data часть запроса',
        rawData: body,
      );
    }
    try {
      final apiResponseMeta = Meta.fromJson(metaJson);

      if (!apiResponseMeta.success) {
        return BaseApiResponse(
          error: apiResponseMeta.error,
          meta: apiResponseMeta,
          rawData: body,
        );
      }

      return BaseApiResponse(
        dataJson: dataJson,
        meta: apiResponseMeta,
        rawData: body,
      );
    } catch (e) {
      return BaseApiResponse(
        error: 'Не удалось разобрать meta часть запроса',
        rawData: body,
      );
    }
  }
}
