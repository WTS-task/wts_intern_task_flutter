import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class MessageRepository extends PrivateApi {
  MessageRepository(super.authRepository);

  Future<ApiResponse<List<MessageModel>>> fetchMessages({
    required int chatId,
    int? offset,
    int? limit,
  }) async {
    final params = {
      'chatId': chatId,
      if (offset != null) 'offset': offset,
      if (limit != null) 'limit': limit,
    };

    final response = await get(
      '/messenger/message/messages',
      queryParameters: params,
    );

    return ApiResponseParser.parseListFromResponse(
      response,
      key: 'messages',
      fromJson: MessageModel.fromJson,
      emptyError: 'Сообщения не найдены',
    );
  }

  Future<ApiResponse<MessageModel>> sendMessage({
    required int chatId,
    String? text,
    XFile? file,
  }) async {
    final formData = FormData.fromMap({
      'chatId': chatId,
      if (text != null && text.trim().isNotEmpty) 'text': text.trim(),
      if (file != null)
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.name,
        ),
    });

    final response = await postWithFile(
      '/messenger/message/send',
      data: formData,
    );

    return ApiResponseParser.parseObjectFromResponse(
      response,
      key: 'message',
      fromJson: MessageModel.fromJson,
    );
  }
}
