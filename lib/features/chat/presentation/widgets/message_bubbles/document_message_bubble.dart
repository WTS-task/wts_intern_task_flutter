import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/bubble_decoration.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/base_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_time_label.dart';
import 'package:wts_task/features/chat/utils/document_opener.dart';
import 'package:open_file/open_file.dart';

class DocumentMessageBubble extends BaseMessageBubble {
  const DocumentMessageBubble({required super.message, super.key});

  @override
  Widget buildBubble(BuildContext context) {
    return InkWell(
      onTap: () => _openDocument(context, file!.url!),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: bubbleDecoration(context, isMe: isMe),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.insert_drive_file,
              color: isMe ? Colors.white : Colors.black87,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                file!.originalName ?? 'Файл',
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black87,
                  decoration: TextDecoration.underline,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            MessageTimeLabel(createdAt: createdAt, isMe: isMe),
          ],
        ),
      ),
    );
  }

  Future<void> _openDocument(BuildContext context, String url) async {
    try {
      final result = await DocumentOpener.open(url);
      if (result.type != ResultType.done) {
        _showErrorDialog(context, 'Не удалось открыть файл: ${result.message}');
      }
    } catch (e) {
      _showErrorDialog(context, 'Ошибка: $e');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ошибка'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
