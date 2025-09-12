import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTimeLabel extends StatelessWidget {
  const MessageTimeLabel({
    required this.createdAt,
    required this.isMe,
    super.key,
  });

  final DateTime? createdAt;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    if (createdAt == null) return const SizedBox.shrink();
    return Text(
      DateFormat('HH:mm').format(createdAt!),
      style: TextStyle(
        fontSize: 12,
        color: isMe ? Colors.white70 : Colors.black54,
      ),
    );
  }
}
