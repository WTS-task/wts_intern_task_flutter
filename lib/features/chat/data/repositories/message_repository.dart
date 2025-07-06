import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/core/exceptions/repo_exception.dart';
import 'package:wts_task/features/chat/data/services/message_service.dart';

class MessageRepository {
  final MessageService _service = MessageService.instance;

  Future<List<MessageModel>> getAllMessages() async {
    try {
      return await _service.readMessages();
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }

  Future<void> saveAllMessages(List<MessageModel> messages) async {
    try {
      await _service.saveMessages(messages);
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }

  Future<void> addMessage(MessageModel newMessage) async {
    try {
      await _service.addMessage(newMessage);
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }

  Future<void> clearMessages() async {
    try {
      await _service.clearMessages();
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }
}
