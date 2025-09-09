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
  

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    final apiResponse = await _repository.fetchMessages(
      chatId: chatId,
      offset: offset,
    );
    if (apiResponse.isError) {
      onLoadingError(apiResponse.error ?? 'Ошибка загрузки');
      return;
    }
    final next = apiResponse.result ?? [];
    await onNextItemsLoaded(next, loadingUuid);
  }
  
  Future<void> sendMessage({String? text, FileModel? file}) async {
    final hasText = (text != null && text.trim().isNotEmpty);
    final hasFile = file != null;
    if (!hasText && !hasFile) return;

    if (hasText && !hasFile) {
      final apiResponse = await _repository.sendMessage(
        chatId: chatId,
        text: text.trim(),
      );
      if (apiResponse.isError) {
        debugPrint('Error sending message: ${apiResponse.error}');
        return;
      }
      final created = apiResponse.result;
      if (created != null) {
        addItem(created);
        notifyListeners();
      }
    } else if (hasFile) {
      final apiResponse = await _repository.sendFileMessage(
        chatId: chatId,
        filePath: file.url ?? '',
        fileName: file.originalName ?? 'file',
        fileType: file.type ?? 'document',
        text: text,
      );
      if (apiResponse.isError) {
        debugPrint('Error sending file message: ${apiResponse.error}');
        return;
      }
      final created = apiResponse.result;
      if (created != null) {
        addItem(created);
        notifyListeners();
      }
    }
  }

  // Removed sendFileMessage in favor of unified sendMessage

  Future<void> clearChat() async {
    try {
      replaceItems([]);
      notifyListeners();
    } catch (e) {
      onLoadingError(e.toString());
    }
  }
}
