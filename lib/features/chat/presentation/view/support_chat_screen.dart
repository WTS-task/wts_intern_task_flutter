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
  ChatViewModel createModel() => ChatViewModel(
        repository: context.read<MessageRepository>(),
      );

  Future<void> _handleAttachmentSelected(
      BuildContext innerContext, AttachmentType type,
      {String? payload}) async {
    final file = await AttachmentHandler.handle(innerContext, type, payload: payload);
    if (file != null) {
      model.sendMessage(file: file);
    }
  }

  void _handleSend(String text) {
    model.sendMessage(text: text);
  }

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final message = model.items[index];
    bool showDateSeparator = false;
    if (index == 0) {
      showDateSeparator = true;
    } else {
      final previousMessage = model.items[index - 1];
      final current = DateTime.fromMillisecondsSinceEpoch(message.createdAt ?? 0);
      final prev = DateTime.fromMillisecondsSinceEpoch(previousMessage.createdAt ?? 0);
      if (!current.isSameDay(prev)) {
        showDateSeparator = true;
      }
    }
    if (showDateSeparator) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DateSeparatorWidget(timestamp: message.createdAt),
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
