import 'package:flutter/material.dart';
import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/features/chat/data/repositories/message_repository.dart';

class ChatViewModel extends ListModel<MessageModel> {
  ChatViewModel({required MessageRepository repository, this.chatId = 2})
      : _repository = repository,
        super(items: []);

  final MessageRepository _repository;
  final int chatId;

  DateTime? _lastApiUpdate;
  static const Duration _cacheValidDuration = Duration(minutes: 5);

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    try {
      final apiResponse = await _repository.fetchMessages(
        chatId: chatId,
        offset: offset,
      );
      if (apiResponse.isError) {
        onLoadingError(apiResponse.error ?? 'Ошибка загрузки');
        return;
      }
      final next = apiResponse.result ?? [];
      _lastApiUpdate = DateTime.now();
      await onNextItemsLoaded(next, loadingUuid);
    } catch (e) {
      onLoadingError(e.toString());
    }
  }

  Future<void> refreshMessages() async {
    reset();
    await loadData();
  }

  bool get needsRefresh {
    return _lastApiUpdate == null ||
        DateTime.now().difference(_lastApiUpdate!) > _cacheValidDuration;
  }

  Future<void> sendMessage(MessageModel message) async {
    try {
      addItem(message);
      notifyListeners();
      final apiResponse = await _repository.sendMessage(
        chatId: chatId,
        text: message.text ?? '',
      );
      if (apiResponse.isError) {
        debugPrint('Error sending message: ${apiResponse.error}');
      } else {
        _lastApiUpdate = DateTime.now();
      }
    } catch (e) {
      onLoadingError(e.toString());
    }
  }

  Future<void> sendFileMessage({
    required String filePath,
    required String fileName,
    required String fileType,
  }) async {
    try {
      final message = MessageModel(
        text: null,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        user: UserModel(name: 'Me', avatar: null, userId: 1),
        isIncoming: 0,
        file: FileModel(
          url: filePath,
          type: fileType,
          originalName: fileName,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );
      addItem(message);
      notifyListeners();
      _lastApiUpdate = DateTime.now();
    } catch (e) {
      onLoadingError(e.toString());
    }
  }

  Future<void> clearChat() async {
    try {
      replaceItems([]);
      notifyListeners();
    } catch (e) {
      onLoadingError(e.toString());
    }
  }

  Future<void> markMessagesAsViewed({required List<int> messageIds}) async {
    try {
      final res = await _repository.markMessagesAsViewed(
        chatId: chatId,
        messageIds: messageIds,
      );
      if (res.isError) {
        debugPrint('Error marking messages as viewed: ${res.error}');
      }
    } catch (e) {
      debugPrint('Exception marking messages as viewed: $e');
    }
  }

  Future<int> getUnreadCount() async {
    try {
      final res = await _repository.getUnreadCount();
      if (res.isError) return 0;
      return res.result ?? 0;
    } catch (_) {
      return 0;
    }
  }
}
