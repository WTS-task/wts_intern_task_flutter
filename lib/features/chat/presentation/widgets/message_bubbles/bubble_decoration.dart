import 'package:flutter/material.dart';

BoxDecoration bubbleDecoration(BuildContext context, {required bool isMe}) {
  return BoxDecoration(
    color: isMe ? Theme.of(context).primaryColor : Colors.grey[300],
    borderRadius: BorderRadius.only(
      topLeft: const Radius.circular(12),
      topRight: const Radius.circular(12),
      bottomLeft: !isMe ? const Radius.circular(0) : const Radius.circular(12),
      bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(12),
    ),
  );
}
