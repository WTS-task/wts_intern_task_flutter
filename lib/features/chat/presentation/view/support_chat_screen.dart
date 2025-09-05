import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/features/chat/data/repositories/message_repository.dart';
import 'package:wts_task/features/chat/presentation/view_models/chat_view_model.dart';
import 'package:wts_task/features/chat/presentation/widgets/chat_input.dart';
import 'package:wts_task/features/chat/presentation/widgets/date_separator_widget.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubble.dart';
import 'package:wts_task/features/chat/utils/attachment_handler.dart';
import 'package:wts_task/features/chat/utils/date_helpers.dart';

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

  Future<void> _handleAttachmentSelected(BuildContext innerContext, String type) async {
    await AttachmentHandler.handle(innerContext, type);
  }

  void _handleSend(String text) {
    final message = MessageModel(
      text: text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      user: UserModel(name: 'Me', avatar: null, userId: 1),
      isIncoming: 0,
    );
    model.sendMessage(message);
  }

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final message = model.items[index];
    bool showDateSeparator = false;
    if (index == 0) {
      showDateSeparator = true;
    } else {
      final previousMessage = model.items[index - 1];
      if (!isSameDay(message.createdAt, previousMessage.createdAt)) {
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
            onAttachmentSelected: (type) => _handleAttachmentSelected(innerContext, type),
          ),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            context.go('/profile');
          }
        },
      ),
      title: Text(widget.title ?? 'Чат с поддержкой'),
      centerTitle: true,
      actions: null,
    );
  }
}
