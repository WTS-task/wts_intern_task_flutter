import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/bubble_decoration.dart';
import 'base_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_time_label.dart';

class DocumentMessageBubble extends BaseMessageBubble {
  const DocumentMessageBubble({super.key, required super.message});

  @override
  Widget buildBubble(BuildContext context) {
    final isMe = this.isMe;
    final file = this.file!;
    final createdAt = this.createdAt;
    return InkWell(
      onTap: () {
        OpenFile.open(file.url!);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: bubbleDecoration(context, isMe),
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
} 