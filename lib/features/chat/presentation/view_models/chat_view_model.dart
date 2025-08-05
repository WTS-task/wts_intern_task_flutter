import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/features/chat/data/repositories/message_repository.dart';
import 'package:wts_task/features/chat/presentation/view_models/chat_view_model_state.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel(this._repository);

  var _state = const ChatViewModelState(
    loadState: ChatLoadState.loading,
    messages: [],
  );
  ChatViewModelState get state => _state;

  final MessageRepository _repository;

  DateTime? _lastApiUpdate;
  static const Duration _cacheValidDuration = Duration(minutes: 5);

  Future<void> loadMessages({int chatId = 2, bool forceRefresh = false}) async {
    final shouldUpdateFromApi =
        forceRefresh ||
        _lastApiUpdate == null ||
        DateTime.now().difference(_lastApiUpdate!) > _cacheValidDuration;

    if (!shouldUpdateFromApi) {
      try {
        final localMessages = await _repository.getAllMessages();
        _state = _state.copyWith(
          messages: localMessages,
          loadState: localMessages.isEmpty
              ? ChatLoadState.empty
              : ChatLoadState.loaded,
        );
        notifyListeners();
        return;
      } catch (e) {
        debugPrint('Local cache error: $e');
      }
    }

    _state = _state.copyWith(loadState: ChatLoadState.loading);
    notifyListeners();

    try {
      final apiResponse = await _repository.fetchMessages(chatId: chatId);

      if (apiResponse.isError) {
        try {
          final localMessages = await _repository.getAllMessages();
          _state = _state.copyWith(
            messages: localMessages,
            loadState: localMessages.isEmpty
                ? ChatLoadState.empty
                : ChatLoadState.loaded,
          );
        } catch (localError) {
          _state = _state.copyWith(
            loadState: ChatLoadState.error,
            errorMessage: apiResponse.error,
          );
        }
      } else {
        final messages = apiResponse.result ?? [];
        await _repository.saveAllMessages(messages);

        _state = _state.copyWith(
          messages: messages,
          loadState: messages.isEmpty
              ? ChatLoadState.empty
              : ChatLoadState.loaded,
        );

        _lastApiUpdate = DateTime.now();
      }
    } catch (e) {
      try {
        final localMessages = await _repository.getAllMessages();
        _state = _state.copyWith(
          messages: localMessages,
          loadState: localMessages.isEmpty
              ? ChatLoadState.empty
              : ChatLoadState.loaded,
        );
      } catch (localError) {
        _state = _state.copyWith(
          loadState: ChatLoadState.error,
          errorMessage: e.toString(),
        );
      }
    }
    notifyListeners();
  }

  Future<void> sendMessage(MessageModel message, {int chatId = 2}) async {
    try {
      await _repository.addMessage(message);

      final currentMessages = List<MessageModel>.from(_state.messages);
      currentMessages.add(message);
      _state = _state.copyWith(
        messages: currentMessages,
        loadState: ChatLoadState.loaded,
      );
      notifyListeners();

      final apiResponse = await _repository.sendMessage(
        chatId: chatId,
        text: message.text ?? '',
      );

      if (apiResponse.isError) {
        _state = _state.copyWith(
          loadState: ChatLoadState.error,
          errorMessage: apiResponse.error,
        );
        notifyListeners();
      } else {
        _lastApiUpdate = DateTime.now();
      }
    } catch (e) {
      _state = _state.copyWith(
        loadState: ChatLoadState.error,
        errorMessage: e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> sendFileMessage({
    required String filePath,
    required String fileName,
    required String fileType,
    int chatId = 2,
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

      await _repository.addMessage(message);

      final currentMessages = List<MessageModel>.from(_state.messages);
      currentMessages.add(message);
      _state = _state.copyWith(
        messages: currentMessages,
        loadState: ChatLoadState.loaded,
      );
      notifyListeners();

      _lastApiUpdate = DateTime.now();
    } catch (e) {
      _state = _state.copyWith(
        loadState: ChatLoadState.error,
        errorMessage: e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> clearChat({int chatId = 2}) async {
    try {
      await _repository.clearMessages();
      await loadMessages(chatId: chatId);
    } catch (e) {
      _state = _state.copyWith(
        loadState: ChatLoadState.error,
        errorMessage: e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> markMessagesAsViewed({
    required int chatId,
    required List<int> messageIds,
  }) async {
    try {
      final apiResponse = await _repository.markMessagesAsViewed(
        chatId: chatId,
        messageIds: messageIds,
      );

      if (apiResponse.isError) {
        debugPrint('Error marking messages as viewed: ${apiResponse.error}');
      }
    } catch (e) {
      debugPrint('Exception marking messages as viewed: $e');
    }
  }

  Future<int> getUnreadCount() async {
    try {
      final apiResponse = await _repository.getUnreadCount();
      if (apiResponse.isError) {
        return 0;
      }
      return apiResponse.result ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> refreshMessages({int chatId = 2}) async {
    await loadMessages(chatId: chatId, forceRefresh: true);
  }

  bool get needsRefresh {
    return _lastApiUpdate == null ||
        DateTime.now().difference(_lastApiUpdate!) > _cacheValidDuration;
  }
}
