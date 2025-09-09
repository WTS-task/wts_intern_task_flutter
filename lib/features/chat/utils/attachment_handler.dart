import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/features/chat/utils/attachment_type.dart';

class AttachmentHandler {
  static Future<FileModel?> handle(
    BuildContext context,
    AttachmentType type, {
    String? payload,
  }) async {

    if (type == AttachmentType.image) {
      final imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        return FileModel(
          url: pickedFile.path,
          type: 'image',
          originalName: pickedFile.name,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
      }
    } else if (type == AttachmentType.camera) {
      final imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        return FileModel(
          url: pickedFile.path,
          type: 'image',
          originalName: pickedFile.name,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
      }
    } else if (type == AttachmentType.document) {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        return FileModel(
          url: result.files.single.path!,
          type: 'document',
          originalName: result.files.single.name,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
      }
    } else if (type == AttachmentType.video) {
      final imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickVideo(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        return FileModel(
          url: pickedFile.path,
          type: 'video',
          originalName: pickedFile.name,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
      }
    } else if (type == AttachmentType.audio && payload != null) {
      final path = payload;
      return FileModel(
        url: path,
        type: 'audio',
        originalName: 'voice.aac',
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
    }
    return null;
  }
}
