import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/utils/date_helpers.dart';

class DateSeparatorWidget extends StatelessWidget {
  const DateSeparatorWidget({required this.date, super.key});

  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        date?.formatDate() ?? '',
        style: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
