// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      messageId: (json['messageId'] as num?)?.toInt(),
      senderUserId: (json['senderUserId'] as num?)?.toInt(),
      chatId: (json['chatId'] as num?)?.toInt(),
      text: json['text'] as String?,
      isAutoMessage: (json['isAutoMessage'] as num?)?.toInt(),
      createdAt: _$JsonConverterFromJson<int, DateTime>(
        json['createdAt'],
        const DateTimeJsonConverter().fromJson,
      ),
      isIncoming: (json['isIncoming'] as num?)?.toInt(),
      isSystem: (json['isSystem'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      isUpdated: (json['isUpdated'] as num?)?.toInt(),
      file:
          json['file'] == null
              ? null
              : FileModel.fromJson(json['file'] as Map<String, dynamic>),
      user:
          json['user'] == null
              ? null
              : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'senderUserId': instance.senderUserId,
      'chatId': instance.chatId,
      'text': instance.text,
      'isAutoMessage': instance.isAutoMessage,
      'createdAt': _$JsonConverterToJson<int, DateTime>(
        instance.createdAt,
        const DateTimeJsonConverter().toJson,
      ),
      'isIncoming': instance.isIncoming,
      'isSystem': instance.isSystem,
      'status': instance.status,
      'isUpdated': instance.isUpdated,
      'file': instance.file,
      'user': instance.user,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_FileModel _$FileModelFromJson(Map<String, dynamic> json) => _FileModel(
  fileId: (json['fileId'] as num?)?.toInt(),
  url: json['url'] as String?,
  type: json['type'] as String?,
  mimeType: json['mimeType'] as String?,
  originalName: json['originalName'] as String?,
  createdAt: _$JsonConverterFromJson<int, DateTime>(
    json['createdAt'],
    const DateTimeJsonConverter().fromJson,
  ),
  videoFile:
      json['videoFile'] == null
          ? null
          : VideoFileModel.fromJson(json['videoFile'] as Map<String, dynamic>),
  audioFile:
      json['audioFile'] == null
          ? null
          : AudioFileModel.fromJson(json['audioFile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FileModelToJson(_FileModel instance) =>
    <String, dynamic>{
      'fileId': instance.fileId,
      'url': instance.url,
      'type': instance.type,
      'mimeType': instance.mimeType,
      'originalName': instance.originalName,
      'createdAt': _$JsonConverterToJson<int, DateTime>(
        instance.createdAt,
        const DateTimeJsonConverter().toJson,
      ),
      'videoFile': instance.videoFile,
      'audioFile': instance.audioFile,
    };

_VideoFileModel _$VideoFileModelFromJson(Map<String, dynamic> json) =>
    _VideoFileModel(
      videoPreviewImageFile:
          json['videoPreviewImageFile'] == null
              ? null
              : VideoPreviewImageFileModel.fromJson(
                json['videoPreviewImageFile'] as Map<String, dynamic>,
              ),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VideoFileModelToJson(_VideoFileModel instance) =>
    <String, dynamic>{
      'videoPreviewImageFile': instance.videoPreviewImageFile,
      'width': instance.width,
      'height': instance.height,
      'duration': instance.duration,
    };

_VideoPreviewImageFileModel _$VideoPreviewImageFileModelFromJson(
  Map<String, dynamic> json,
) => _VideoPreviewImageFileModel(
  url: json['url'] as String?,
  previewUrl: json['previewUrl'] as String?,
  width: (json['width'] as num?)?.toInt(),
  blurHash: json['blurHash'] as String?,
  height: (json['height'] as num?)?.toInt(),
  previewWidth: (json['previewWidth'] as num?)?.toInt(),
  previewHeight: (json['previewHeight'] as num?)?.toInt(),
);

Map<String, dynamic> _$VideoPreviewImageFileModelToJson(
  _VideoPreviewImageFileModel instance,
) => <String, dynamic>{
  'url': instance.url,
  'previewUrl': instance.previewUrl,
  'width': instance.width,
  'blurHash': instance.blurHash,
  'height': instance.height,
  'previewWidth': instance.previewWidth,
  'previewHeight': instance.previewHeight,
};

_AudioFileModel _$AudioFileModelFromJson(Map<String, dynamic> json) =>
    _AudioFileModel(duration: (json['duration'] as num?)?.toDouble());

Map<String, dynamic> _$AudioFileModelToJson(_AudioFileModel instance) =>
    <String, dynamic>{'duration': instance.duration};

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  userId: (json['userId'] as num?)?.toInt(),
  name: json['name'] as String?,
  avatar: json['avatar'] as String?,
  toRelationStatus: (json['toRelationStatus'] as num?)?.toInt(),
  fromRelationStatus: (json['fromRelationStatus'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'avatar': instance.avatar,
      'toRelationStatus': instance.toRelationStatus,
      'fromRelationStatus': instance.fromRelationStatus,
    };
