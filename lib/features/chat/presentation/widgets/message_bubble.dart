import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/audio_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/document_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/image_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/text_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/video_message_bubble.dart';
import 'package:wts_task/features/chat/utils/attachment_type.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({required this.message, super.key});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final file = message.file;
    final text = message.text;

    if (file != null && file.url != null) {
      final AttachmentType? type = _parseAttachmentType(file.type);
      switch (type) {
        case AttachmentType.image:
          return ImageMessageBubble(message: message);
        case AttachmentType.video:
          return VideoMessageBubble(message: message);
        case AttachmentType.audio:
          return AudioMessageBubble(message: message);
        case AttachmentType.document:
          return DocumentMessageBubble(message: message);
        case AttachmentType.camera:
          return ImageMessageBubble(message: message);
        default:
          return DocumentMessageBubble(message: message);
      }
    } else if (text != null && text.isNotEmpty) {
      return TextMessageBubble(message: message);
    } else {
      return const SizedBox.shrink();
    }
  }

  AttachmentType? _parseAttachmentType(String? raw) {
    switch (raw) {
      case 'image':
        return AttachmentType.image;
      case 'video':
        return AttachmentType.video;
      case 'audio':
        return AttachmentType.audio;
      case 'document':
      case 'file':
        return AttachmentType.document;
      default:
        return null;
    }
  }
}
