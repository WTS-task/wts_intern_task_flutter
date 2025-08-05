import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/presentation/widgets/voice_record_dialog.dart';

class AttachmentPopupMenu extends StatelessWidget {
  const AttachmentPopupMenu({required this.onAttachmentSelected, super.key});

  final Function(String) onAttachmentSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.attach_file, color: Colors.grey[600]),
      onSelected: (value) async {
        if (value == 'audio') {
          final path = await showDialog<String>(
            context: context,
            builder: (context) => const VoiceRecordDialog(),
          );
          if (path != null) {
            onAttachmentSelected('voice_file:$path');
          }
        } else {
          onAttachmentSelected(value);
        }
      },
      color: Colors.white,
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'image',
          child: Row(
            children: [
              Icon(Icons.image, color: Colors.black54),
              SizedBox(width: 8),
              Text('Изображение'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'camera',
          child: Row(
            children: [
              Icon(Icons.camera_alt, color: Colors.black54),
              SizedBox(width: 8),
              Text('Камера'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'document',
          child: Row(
            children: [
              Icon(Icons.insert_drive_file, color: Colors.black54),
              SizedBox(width: 8),
              Text('Документ'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'video',
          child: Row(
            children: [
              Icon(Icons.videocam, color: Colors.black54),
              SizedBox(width: 8),
              Text('Видео'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'audio',
          child: Row(
            children: [
              Icon(Icons.mic, color: Colors.black54),
              SizedBox(width: 8),
              Text('Голосовое сообщение'),
            ],
          ),
        ),
      ],
      offset: const Offset(0, -260),
    );
  }
}
