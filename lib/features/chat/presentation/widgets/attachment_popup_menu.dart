import 'package:flutter/material.dart';

class AttachmentPopupMenu extends StatelessWidget {
  final Function(String) onAttachmentSelected;
  const AttachmentPopupMenu({super.key, required this.onAttachmentSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.attach_file, color: Colors.grey[600]),
      onSelected: (value) async {
        onAttachmentSelected(value);
      },
      color: Colors.white,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'image',
          child: Row(
            children: const [
              Icon(Icons.image, color: Colors.black54),
              SizedBox(width: 8),
              Text('Изображение'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'camera',
          child: Row(
            children: const [
              Icon(Icons.camera_alt, color: Colors.black54),
              SizedBox(width: 8),
              Text('Камера'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'document',
          child: Row(
            children: const [
              Icon(Icons.insert_drive_file, color: Colors.black54),
              SizedBox(width: 8),
              Text('Документ'),
            ],
          ),
        ),
      ],
      offset: const Offset(0, -170),
    );
  }
}
