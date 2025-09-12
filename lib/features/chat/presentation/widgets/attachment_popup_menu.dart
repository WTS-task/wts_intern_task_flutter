import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/presentation/widgets/voice_record_dialog.dart';
import 'package:wts_task/features/chat/utils/attachment_type.dart';

class AttachmentPopupMenu extends StatelessWidget {
  const AttachmentPopupMenu({required this.onAttachmentSelected, super.key});

  final Function(AttachmentType, {String? payload}) onAttachmentSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<AttachmentType>(
      icon: Icon(Icons.attach_file, color: Colors.grey[600]),
      onSelected: (value) async {
        if (value == AttachmentType.audio) {
          final path = await showDialog<String>(
            context: context,
            builder: (context) => const VoiceRecordDialog(),
          );
          if (path != null) {
            onAttachmentSelected(AttachmentType.audio, payload: path);
          }
        } else {
          onAttachmentSelected(value);
        }
      },
      color: Colors.white,
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: AttachmentType.image,
          child: Row(
            children: [
              Icon(Icons.image, color: Colors.black54),
              SizedBox(width: 8),
              Text('Изображение'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: AttachmentType.camera,
          child: Row(
            children: [
              Icon(Icons.camera_alt, color: Colors.black54),
              SizedBox(width: 8),
              Text('Камера'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: AttachmentType.document,
          child: Row(
            children: [
              Icon(Icons.insert_drive_file, color: Colors.black54),
              SizedBox(width: 8),
              Text('Документ'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: AttachmentType.video,
          child: Row(
            children: [
              Icon(Icons.videocam, color: Colors.black54),
              SizedBox(width: 8),
              Text('Видео'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: AttachmentType.audio,
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
