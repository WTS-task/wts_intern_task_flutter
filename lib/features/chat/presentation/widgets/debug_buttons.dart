import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/features/chat/presentation/view_models/chat_view_model.dart';

class DebugConsolePrintButton extends StatelessWidget {
  const DebugConsolePrintButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.code),
      tooltip: 'Print Hive messageBox',
      onPressed: () async {
        final box = Hive.box<String>('messageBox');
        final jsonString = box.get('messageList');
        if (jsonString != null) {
          try {
            final decoded = jsonDecode(jsonString);
            final formatted = const JsonEncoder.withIndent(
              '  ',
            ).convert(decoded);
            debugPrint(formatted);
          } catch (e) {
            debugPrint(jsonString);
          }
        } else {
          debugPrint('Пусто');
        }
      },
    );
  }
}

class DebugClearMessagesButton extends StatelessWidget {
  const DebugClearMessagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.clear_all),
      tooltip: 'Clear chat history',
      onPressed: () async {
        final vm = context.read<ChatViewModel>();
        await vm.clearChat();
      },
    );
  }
}
