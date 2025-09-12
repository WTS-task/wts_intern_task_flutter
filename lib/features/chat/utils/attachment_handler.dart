import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wts_task/features/chat/utils/attachment_type.dart';
import 'package:wts_task/features/chat/presentation/widgets/voice_record_dialog.dart';

class AttachmentHandler {
  static Future<XFile?> handle(
    BuildContext context,
    AttachmentType type,
  ) async {
    if (type == AttachmentType.image) {
      return await ImagePicker().pickImage(source: ImageSource.gallery);
    } else if (type == AttachmentType.camera) {
      return await ImagePicker().pickImage(source: ImageSource.camera);
    } else if (type == AttachmentType.document) {
      final result = await FilePicker.platform.pickFiles();
      final path = result?.files.single.path;
      final name = result?.files.single.name;
      if (path != null) {
        return XFile(path, name: name);
      }
      return null;
    } else if (type == AttachmentType.video) {
      return await ImagePicker().pickVideo(source: ImageSource.gallery);
    } else if (type == AttachmentType.audio) {
      return await showDialog<XFile?>(
        context: context,
        builder: (context) => const VoiceRecordDialog(),
      );
    }
    return null;
  }
}
