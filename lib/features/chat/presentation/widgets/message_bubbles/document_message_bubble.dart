import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/bubble_decoration.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/base_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_time_label.dart';

class DocumentMessageBubble extends BaseMessageBubble {
  const DocumentMessageBubble({required super.message, super.key});

  @override
  Widget buildBubble(BuildContext context) {
    final isMe = this.isMe;
    final file = this.file!;
    final createdAt = this.createdAt;

    return InkWell(
      onTap: () => _openDocument(context, file.url!),
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
                file.originalName ?? 'Файл',
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
    final isNetworkFile =
        url.startsWith('http://') || url.startsWith('https://');

    try {
      String filePath;
      if (isNetworkFile) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode != 200) {
          throw Exception('Ошибка загрузки файла');
        }

        final tempDir = await getTemporaryDirectory();
        final fileName = url.split('/').last;
        final file = File('${tempDir.path}/$fileName');
        await file.writeAsBytes(response.bodyBytes);
        filePath = file.path;
      } else {
        filePath = url;
      }

      final result = await OpenFile.open(filePath);
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
