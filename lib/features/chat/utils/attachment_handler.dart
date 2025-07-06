import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';
import 'package:wts_task/features/chat/presentation/view_models/chat_view_model.dart';
import 'package:provider/provider.dart';

class AttachmentHandler {
  static Future<void> handle(BuildContext context, String type) async {
    final vm = context.read<ChatViewModel>();
    if (type == 'image') {
      final imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        await vm.sendMessage(
          MessageModel(
            file: FileModel(url: pickedFile.path, type: 'image'),
            createdAt: DateTime.now().millisecondsSinceEpoch,
            user: UserModel(name: 'Me', avatar: null, userId: 1),
            isIncoming: 0,
          ),
        );
      }
    } else if (type == 'camera') {
      final imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        await vm.sendMessage(
          MessageModel(
            file: FileModel(url: pickedFile.path, type: 'image'),
            createdAt: DateTime.now().millisecondsSinceEpoch,
            user: UserModel(name: 'Me', avatar: null, userId: 1),
            isIncoming: 0,
          ),
        );
      }
    } else if (type == 'document') {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        await vm.sendMessage(
          MessageModel(
            file: FileModel(url: result.files.single.path, type: 'document', originalName: result.files.single.name),
            createdAt: DateTime.now().millisecondsSinceEpoch,
            user: UserModel(name: 'Me', avatar: null, userId: 1),
            isIncoming: 0,
          ),
        );
      }
    }
  }
}
