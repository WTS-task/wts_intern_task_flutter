import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';


part 'chat_view_model_state.freezed.dart';

enum ChatLoadState { empty, loading, error, loaded }

@freezed
abstract class ChatViewModelState with _$ChatViewModelState {
  const factory ChatViewModelState({
    required ChatLoadState loadState,
    required List<MessageModel> messages,
    String? errorMessage,
  }) = _ChatViewModelState;
} 