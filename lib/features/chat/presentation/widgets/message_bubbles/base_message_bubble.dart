import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';

abstract class BaseMessageBubble extends StatelessWidget {
  const BaseMessageBubble({required this.message, super.key});

  final MessageModel message;

  bool get isMe => message.isIncoming == 0;

  DateTime? get createdAt => message.createdAt != null
      ? DateTime.fromMillisecondsSinceEpoch(message.createdAt!)
      : null;
  FileModel? get file => message.file;

  Widget buildBubble(BuildContext context);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: buildBubble(context),
      ),
    );
  }
}
