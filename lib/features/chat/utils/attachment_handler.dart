import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wts_task/features/chat/presentation/view_models/chat_view_model.dart';
import 'package:provider/provider.dart';

class AttachmentHandler {
  static Future<void> handle(BuildContext context, String type) async {
    final vm = context.read<ChatViewModel>();

    if (type == 'image') {
      final imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        await vm.sendFileMessage(
          filePath: pickedFile.path,
          fileName: pickedFile.name,
          fileType: 'image',
        );
      }
    } else if (type == 'camera') {
      final imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        await vm.sendFileMessage(
          filePath: pickedFile.path,
          fileName: pickedFile.name,
          fileType: 'image',
        );
      }
    } else if (type == 'document') {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        await vm.sendFileMessage(
          filePath: result.files.single.path!,
          fileName: result.files.single.name,
          fileType: 'document',
        );
      }
    } else if (type == 'video') {
      final imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickVideo(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        await vm.sendFileMessage(
          filePath: pickedFile.path,
          fileName: pickedFile.name,
          fileType: 'video',
        );
      }
    } else if (type.startsWith('voice_file:')) {
      final path = type.substring('voice_file:'.length);
      await vm.sendFileMessage(
        filePath: path,
        fileName: 'voice.aac',
        fileType: 'audio',
      );
    }
  }
}
