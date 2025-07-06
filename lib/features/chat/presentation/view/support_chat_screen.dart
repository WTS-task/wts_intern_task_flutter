import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/features/chat/presentation/view_models/chat_view_model.dart';
import 'package:wts_task/features/chat/presentation/view_models/chat_view_model_state.dart';
import 'package:wts_task/features/chat/presentation/widgets/chat_input.dart';
import 'package:wts_task/features/chat/presentation/widgets/debug_buttons.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubble.dart';
import 'package:wts_task/features/chat/utils/date_helpers.dart';
import 'package:wts_task/features/chat/presentation/widgets/date_separator_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/features/chat/utils/attachment_handler.dart';

class SupportChatScreen extends StatefulWidget {
  const SupportChatScreen({super.key});

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatViewModel>().loadMessages();
    });
  }

  Future<void> _handleAttachmentSelected(String type) async {
    await AttachmentHandler.handle(context, type);
  }

  void _handleSend(String text) {
    final vm = context.read<ChatViewModel>();
    vm.sendMessage(
      MessageModel(
        text: text,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        user: UserModel(name: 'Me', avatar: null, userId: 1),
        isIncoming: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ChatViewModel>();
    final state = vm.state;

    Widget body;
    switch (state.loadState) {
      case ChatLoadState.loading:
        body = const Center(child: CircularProgressIndicator());
        break;
      case ChatLoadState.empty:
        body = const Center(child: Text('Нет сообщений'));
        break;
      case ChatLoadState.error:
        body = Center(child: Text(state.errorMessage ?? 'Ошибка загрузки чата'));
        break;
      case ChatLoadState.loaded:
        body = ListView.builder(
          reverse: true,
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            final reversedIndex = state.messages.length - 1 - index;
            final message = state.messages[reversedIndex];
            bool showDateSeparator = false;
            if (reversedIndex == 0) {
              showDateSeparator = true;
            } else {
              final previousMessage = state.messages[reversedIndex - 1];
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
          },
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(
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
        title: const Text('Чат с поддержкой'),
        centerTitle: true,
        actions: [
          const DebugConsolePrintButton(),
          const DebugClearMessagesButton(),
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Expanded(child: body),
          ChatInput(
            onSend: _handleSend,
            onAttachmentSelected: _handleAttachmentSelected,
          ),
        ],
      ),
    );
  }
}
