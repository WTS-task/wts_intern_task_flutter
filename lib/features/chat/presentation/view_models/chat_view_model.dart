import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wts_task/features/chat/data/repositories/message_repository.dart';

class ChatViewModel extends ListModel<MessageModel> {
  ChatViewModel({required MessageRepository repository, this.chatId = 2})
    : _repository = repository;

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

  Future<void> sendMessage({String? text, XFile? file}) async {
    if (file == null && (text?.trim().isEmpty ?? true)) return;

    final response = await _repository.sendMessage(
      chatId: chatId,
      text: text?.trim(),
      file: file,
    );
    if (response.isError) {
      onLoadingError(response.error ?? 'Ошибка отправки');
      return;
    }
    final created = response.result;
    if (created != null) {
      addItem(created, position: 0);
    }
  }

  Future<void> clearChat() async {
    try {
      replaceItems([]);
    } catch (e) {
      onLoadingError(e.toString());
    }
  }
}
