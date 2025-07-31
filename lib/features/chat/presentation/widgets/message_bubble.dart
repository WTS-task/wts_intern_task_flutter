import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/audio_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/document_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/image_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/text_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/video_message_bubble.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({required this.message, super.key});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final file = message.file;
    final text = message.text;

    if (file != null && file.url != null) {
      if (file.type == 'image') {
        return ImageMessageBubble(message: message);
      } else if (file.type == 'video') {
        return VideoMessageBubble(message: message);
      } else if (file.type == 'audio') {
        return AudioMessageBubble(message: message);
      } else if (file.type == 'file' || file.type == 'document') {
        return DocumentMessageBubble(message: message);
      } else {
        return DocumentMessageBubble(message: message);
      }
    } else if (text != null && text.isNotEmpty) {
      return TextMessageBubble(message: message);
    } else {
      return const SizedBox.shrink();
    }
  }
}
