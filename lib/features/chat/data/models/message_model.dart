import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/core/services/api/json_converters.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    int? messageId,
    int? senderUserId,
    int? chatId,
    String? text,
    int? isAutoMessage,
    @DateTimeJsonConverter() DateTime? createdAt,
    int? isIncoming,
    int? isSystem,
    int? status,
    int? isUpdated,
    FileModel? file,
    UserModel? user,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}

@freezed
abstract class FileModel with _$FileModel {
  const factory FileModel({
    int? fileId,
    String? url,
    String? type,
    String? mimeType,
    String? originalName,
    @DateTimeJsonConverter() DateTime? createdAt,
    VideoFileModel? videoFile,
    AudioFileModel? audioFile,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);
}

@freezed
abstract class VideoFileModel with _$VideoFileModel {
  const factory VideoFileModel({
    VideoPreviewImageFileModel? videoPreviewImageFile,
    int? width,
    int? height,
    double? duration,
  }) = _VideoFileModel;

  factory VideoFileModel.fromJson(Map<String, dynamic> json) => _$VideoFileModelFromJson(json);
}

@freezed
abstract class VideoPreviewImageFileModel with _$VideoPreviewImageFileModel {
  const factory VideoPreviewImageFileModel({
    String? url,
    String? previewUrl,
    int? width,
    String? blurHash,
    int? height,
    int? previewWidth,
    int? previewHeight,
  }) = _VideoPreviewImageFileModel;

  factory VideoPreviewImageFileModel.fromJson(Map<String, dynamic> json) => _$VideoPreviewImageFileModelFromJson(json);
}

@freezed
abstract class AudioFileModel with _$AudioFileModel {
  const factory AudioFileModel({
    double? duration,
  }) = _AudioFileModel;

  factory AudioFileModel.fromJson(Map<String, dynamic> json) => _$AudioFileModelFromJson(json);
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    int? userId,
    String? name,
    String? avatar,
    int? toRelationStatus,
    int? fromRelationStatus,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
