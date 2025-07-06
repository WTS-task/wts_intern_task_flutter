import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/document_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/image_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/text_message_bubble.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final file = message.file;
    final text = message.text;

    if (file != null && file.type == 'image' && file.url != null) {
      return ImageMessageBubble(message: message);
    } else if (file != null && (file.type == 'file' || file.type == 'document' ||
        (file.type != 'image')) && file.url != null) {
      return DocumentMessageBubble(message: message);
    } else if (text != null && text.isNotEmpty) {
      return TextMessageBubble(message: message);
    } else {
      return const SizedBox.shrink();
    }
  }
}
