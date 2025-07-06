import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/base_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/bubble_decoration.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_time_label.dart';

class TextMessageBubble extends BaseMessageBubble {
  const TextMessageBubble({super.key, required super.message});

  @override
  Widget buildBubble(BuildContext context) {
    final isMe = this.isMe;
    final text = message.text ?? '';
    final createdAt = this.createdAt;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: bubbleDecoration(context, isMe),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 6),
          MessageTimeLabel(createdAt: createdAt, isMe: isMe),
        ],
      ),
    );
  }
} 