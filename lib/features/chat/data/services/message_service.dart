import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/core/exceptions/cache_exception.dart';
import 'package:wts_task/features/chat/data/models/message_model.dart';

class MessageService {
  MessageService._();

  static const String _boxName = 'messageBox';
  static const String _key = 'messageList';
  static final MessageService instance = MessageService._();

  static Future<void> init() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      await Hive.openBox<String>(_boxName);
    } on Exception catch (e) {
      throw CacheInitException(errorMsg: e.toString());
    }
  }

  Future<void> saveMessages(List<MessageModel> messageList) async {
    try {
      final box = Hive.box<String>(_boxName);
      final jsonString = messageList.map((e) => e.toJson()).toList();
      await box.put(_key, jsonEncode(jsonString));
    } on Exception catch (e) {
      throw CacheWriteException(errorMsg: e.toString());
    }
  }

  Future<List<MessageModel>> readMessages() async {
    try {
      final box = Hive.box<String>(_boxName);
      final jsonString = box.get(_key);
      if (jsonString == null) return [];
      final decodedString = jsonDecode(jsonString) as List;
      return decodedString
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Exception catch (e) {
      throw CacheReadException(errorMsg: e.toString());
    }
  }

  Future<void> addMessage(MessageModel newMessage) async {
    try {
      final messages = await readMessages();
      messages.add(newMessage);
      await saveMessages(messages);
    } on AppException {
      rethrow;
    } catch (e) {
      throw CacheWriteException(errorMsg: e.toString());
    }
  }

  Future<void> clearMessages() async {
    try {
      await saveMessages(<MessageModel>[]);
    } catch (e) {
      throw CacheWriteException(errorMsg: e.toString());
    }
  }
}
