import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/chat/data/repositories/message_repository.dart';
import 'package:wts_task/features/chat/presentation/view_models/chat_view_model.dart';
import 'package:wts_task/features/chat/presentation/widgets/chat_input.dart';
import 'package:wts_task/features/chat/presentation/widgets/date_separator_widget.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubble.dart';
import 'package:wts_task/features/chat/utils/attachment_handler.dart';
import 'package:wts_task/features/chat/utils/date_helpers.dart';
import 'package:wts_task/features/chat/utils/attachment_type.dart';

class SupportChatScreen extends BasePage {
  const SupportChatScreen({super.key}) : super(title: 'Чат с поддержкой');

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState
    extends BaseListViewPageState<SupportChatScreen, ChatViewModel> {
  @override
  bool get shouldReverseList => true;

  @override
  bool get shouldWrapRefreshIndicator => false;

  @override
  ChatViewModel createModel() =>
      ChatViewModel(repository: context.read<MessageRepository>());

  Future<void> _handleAttachmentSelected(
    BuildContext innerContext,
    AttachmentType type, {
    String? payload,
  }) async {
    final picked = await AttachmentHandler.handle(innerContext, type);
    if (picked != null) {
      await model.sendMessage(file: picked);
    }
  }

  void _handleSend(String text) {
    model.sendMessage(text: text);
  }

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final message = model.items[index];
    bool showDateSeparator = true;
    var date = message.createdAt;
    if (index == 0) {
      final now = DateTime.now();
      showDateSeparator = !DateUtils.isSameDay(message.createdAt, now);
    } else {
      final previousMessage = model.items[index - 1];
      final current = message.createdAt;
      final prev = previousMessage.createdAt;
      date = prev;
      showDateSeparator = !DateUtils.isSameDay(current, prev);
    }


    if (showDateSeparator) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DateSeparatorWidget(date: date),
          MessageBubble(message: message),
        ],
      );
    }
    return MessageBubble(message: message);
  }

  @override
  Widget buildBody(BuildContext context) {
    final body = super.buildBody(context);
    return Column(
      children: [
        Expanded(child: body),
        Builder(
          builder: (innerContext) => ChatInput(
            onSend: _handleSend,
            onAttachmentSelected: (type, {payload}) =>
                _handleAttachmentSelected(innerContext, type, payload: payload),
          ),
        ),
      ],
    );
  }
}
