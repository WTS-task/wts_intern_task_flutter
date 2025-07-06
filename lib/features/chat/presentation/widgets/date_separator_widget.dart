import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/utils/date_helpers.dart';

class DateSeparatorWidget extends StatelessWidget {
  final int? timestamp;
  const DateSeparatorWidget({super.key, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        formatDateSeparator(timestamp),
        style: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
} 
