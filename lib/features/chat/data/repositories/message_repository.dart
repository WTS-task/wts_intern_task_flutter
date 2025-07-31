import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/core/exceptions/repo_exception.dart';
import 'package:wts_task/features/chat/data/services/message_service.dart';
import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';

class MessageRepository extends PrivateApi {
  MessageRepository(super.authRepository);

  final MessageService _localService = MessageService.instance;

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
    required String text,
  }) async {
    final data = {'chatId': chatId, 'text': text};

    final response = await post('/messenger/message/send', data: data);

    return ApiResponseParser.parseObjectFromResponse(
      response,
      key: 'message',
      fromJson: MessageModel.fromJson,
    );
  }

  Future<ApiResponse<void>> markMessagesAsViewed({
    required int chatId,
    required List<int> messageIds,
  }) async {
    final data = {'chatId': chatId, 'messageIds': messageIds};

    final response = await post('/messenger/message/mark-viewed', data: data);

    if (response.isError) {
      return ApiResponse.error(
        error: response.error!,
        baseApiResponse: response,
      );
    }

    return ApiResponse(result: null, baseApiResponse: response);
  }

  Future<ApiResponse<int>> getUnreadCount() async {
    final response = await get('/messenger/message/get-unread-count');

    return ApiResponseParser.parseObjectFromResponse(
      response,
      key: 'unreadCount',
      fromJson: (json) => json as int,
    );
  }

  Future<List<MessageModel>> getAllMessages() async {
    try {
      return await _localService.readMessages();
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }

  Future<void> saveAllMessages(List<MessageModel> messages) async {
    try {
      await _localService.saveMessages(messages);
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }

  Future<void> addMessage(MessageModel newMessage) async {
    try {
      await _localService.addMessage(newMessage);
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }

  Future<void> clearMessages() async {
    try {
      await _localService.clearMessages();
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }
}
