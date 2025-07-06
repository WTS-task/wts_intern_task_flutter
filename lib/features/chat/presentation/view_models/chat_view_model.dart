 import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/features/chat/data/repositories/message_repository.dart';
import 'chat_view_model_state.dart';

class ChatViewModel extends ChangeNotifier {
  var _state = ChatViewModelState(
    loadState: ChatLoadState.loading,
    messages: [],
  );
  ChatViewModelState get state => _state;

  final MessageRepository _repository = MessageRepository();

  Future<void> loadMessages() async {
    _state = _state.copyWith(loadState: ChatLoadState.loading);
    notifyListeners();
    try {
      final messages = await _repository.getAllMessages();
      _state = _state.copyWith(
        messages: messages,
        loadState: messages.isEmpty ? ChatLoadState.empty : ChatLoadState.loaded,
      );
    } catch (e) {
      _state = _state.copyWith(
        loadState: ChatLoadState.error,
        errorMessage: e.toString(),
      );
    }
    notifyListeners();
  }

  Future<void> sendMessage(MessageModel message) async {
    try {
      await _repository.addMessage(message);
      await loadMessages();
    } catch (e) {
      _state = _state.copyWith(
        loadState: ChatLoadState.error,
        errorMessage: e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> clearChat() async {
    try {
      await _repository.clearMessages();
      await loadMessages();
    } catch (e) {
      _state = _state.copyWith(
        loadState: ChatLoadState.error,
        errorMessage: e.toString(),
      );
      notifyListeners();
    }
  }
}