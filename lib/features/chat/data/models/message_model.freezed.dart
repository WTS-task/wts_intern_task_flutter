// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageModel {

 int? get messageId; int? get senderUserId; int? get chatId; String? get text; int? get isAutoMessage; int? get createdAt; int? get isIncoming; int? get isSystem; int? get status; int? get isUpdated; FileModel? get file; UserModel? get user;
/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageModelCopyWith<MessageModel> get copyWith => _$MessageModelCopyWithImpl<MessageModel>(this as MessageModel, _$identity);

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageModel&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.senderUserId, senderUserId) || other.senderUserId == senderUserId)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.text, text) || other.text == text)&&(identical(other.isAutoMessage, isAutoMessage) || other.isAutoMessage == isAutoMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isIncoming, isIncoming) || other.isIncoming == isIncoming)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.status, status) || other.status == status)&&(identical(other.isUpdated, isUpdated) || other.isUpdated == isUpdated)&&(identical(other.file, file) || other.file == file)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId,senderUserId,chatId,text,isAutoMessage,createdAt,isIncoming,isSystem,status,isUpdated,file,user);

@override
String toString() {
  return 'MessageModel(messageId: $messageId, senderUserId: $senderUserId, chatId: $chatId, text: $text, isAutoMessage: $isAutoMessage, createdAt: $createdAt, isIncoming: $isIncoming, isSystem: $isSystem, status: $status, isUpdated: $isUpdated, file: $file, user: $user)';
}


}

/// @nodoc
abstract mixin class $MessageModelCopyWith<$Res>  {
  factory $MessageModelCopyWith(MessageModel value, $Res Function(MessageModel) _then) = _$MessageModelCopyWithImpl;
@useResult
$Res call({
 int? messageId, int? senderUserId, int? chatId, String? text, int? isAutoMessage, int? createdAt, int? isIncoming, int? isSystem, int? status, int? isUpdated, FileModel? file, UserModel? user
});


$FileModelCopyWith<$Res>? get file;$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$MessageModelCopyWithImpl<$Res>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._self, this._then);

  final MessageModel _self;
  final $Res Function(MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messageId = freezed,Object? senderUserId = freezed,Object? chatId = freezed,Object? text = freezed,Object? isAutoMessage = freezed,Object? createdAt = freezed,Object? isIncoming = freezed,Object? isSystem = freezed,Object? status = freezed,Object? isUpdated = freezed,Object? file = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as int?,senderUserId: freezed == senderUserId ? _self.senderUserId : senderUserId // ignore: cast_nullable_to_non_nullable
as int?,chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,isAutoMessage: freezed == isAutoMessage ? _self.isAutoMessage : isAutoMessage // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,isIncoming: freezed == isIncoming ? _self.isIncoming : isIncoming // ignore: cast_nullable_to_non_nullable
as int?,isSystem: freezed == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,isUpdated: freezed == isUpdated ? _self.isUpdated : isUpdated // ignore: cast_nullable_to_non_nullable
as int?,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as FileModel?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileModelCopyWith<$Res>? get file {
    if (_self.file == null) {
    return null;
  }

  return $FileModelCopyWith<$Res>(_self.file!, (value) {
    return _then(_self.copyWith(file: value));
  });
}/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MessageModel implements MessageModel {
  const _MessageModel({this.messageId, this.senderUserId, this.chatId, this.text, this.isAutoMessage, this.createdAt, this.isIncoming, this.isSystem, this.status, this.isUpdated, this.file, this.user});
  factory _MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

@override final  int? messageId;
@override final  int? senderUserId;
@override final  int? chatId;
@override final  String? text;
@override final  int? isAutoMessage;
@override final  int? createdAt;
@override final  int? isIncoming;
@override final  int? isSystem;
@override final  int? status;
@override final  int? isUpdated;
@override final  FileModel? file;
@override final  UserModel? user;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageModelCopyWith<_MessageModel> get copyWith => __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageModel&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.senderUserId, senderUserId) || other.senderUserId == senderUserId)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.text, text) || other.text == text)&&(identical(other.isAutoMessage, isAutoMessage) || other.isAutoMessage == isAutoMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isIncoming, isIncoming) || other.isIncoming == isIncoming)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.status, status) || other.status == status)&&(identical(other.isUpdated, isUpdated) || other.isUpdated == isUpdated)&&(identical(other.file, file) || other.file == file)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId,senderUserId,chatId,text,isAutoMessage,createdAt,isIncoming,isSystem,status,isUpdated,file,user);

@override
String toString() {
  return 'MessageModel(messageId: $messageId, senderUserId: $senderUserId, chatId: $chatId, text: $text, isAutoMessage: $isAutoMessage, createdAt: $createdAt, isIncoming: $isIncoming, isSystem: $isSystem, status: $status, isUpdated: $isUpdated, file: $file, user: $user)';
}


}

/// @nodoc
abstract mixin class _$MessageModelCopyWith<$Res> implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(_MessageModel value, $Res Function(_MessageModel) _then) = __$MessageModelCopyWithImpl;
@override @useResult
$Res call({
 int? messageId, int? senderUserId, int? chatId, String? text, int? isAutoMessage, int? createdAt, int? isIncoming, int? isSystem, int? status, int? isUpdated, FileModel? file, UserModel? user
});


@override $FileModelCopyWith<$Res>? get file;@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(this._self, this._then);

  final _MessageModel _self;
  final $Res Function(_MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messageId = freezed,Object? senderUserId = freezed,Object? chatId = freezed,Object? text = freezed,Object? isAutoMessage = freezed,Object? createdAt = freezed,Object? isIncoming = freezed,Object? isSystem = freezed,Object? status = freezed,Object? isUpdated = freezed,Object? file = freezed,Object? user = freezed,}) {
  return _then(_MessageModel(
messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as int?,senderUserId: freezed == senderUserId ? _self.senderUserId : senderUserId // ignore: cast_nullable_to_non_nullable
as int?,chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,isAutoMessage: freezed == isAutoMessage ? _self.isAutoMessage : isAutoMessage // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,isIncoming: freezed == isIncoming ? _self.isIncoming : isIncoming // ignore: cast_nullable_to_non_nullable
as int?,isSystem: freezed == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,isUpdated: freezed == isUpdated ? _self.isUpdated : isUpdated // ignore: cast_nullable_to_non_nullable
as int?,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as FileModel?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileModelCopyWith<$Res>? get file {
    if (_self.file == null) {
    return null;
  }

  return $FileModelCopyWith<$Res>(_self.file!, (value) {
    return _then(_self.copyWith(file: value));
  });
}/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$FileModel {

 int? get fileId; String? get url; String? get type; String? get mimeType; String? get originalName; int? get createdAt; VideoFileModel? get videoFile; AudioFileModel? get audioFile;
/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileModelCopyWith<FileModel> get copyWith => _$FileModelCopyWithImpl<FileModel>(this as FileModel, _$identity);

  /// Serializes this FileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileModel&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.videoFile, videoFile) || other.videoFile == videoFile)&&(identical(other.audioFile, audioFile) || other.audioFile == audioFile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId,url,type,mimeType,originalName,createdAt,videoFile,audioFile);

@override
String toString() {
  return 'FileModel(fileId: $fileId, url: $url, type: $type, mimeType: $mimeType, originalName: $originalName, createdAt: $createdAt, videoFile: $videoFile, audioFile: $audioFile)';
}


}

/// @nodoc
abstract mixin class $FileModelCopyWith<$Res>  {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) _then) = _$FileModelCopyWithImpl;
@useResult
$Res call({
 int? fileId, String? url, String? type, String? mimeType, String? originalName, int? createdAt, VideoFileModel? videoFile, AudioFileModel? audioFile
});


$VideoFileModelCopyWith<$Res>? get videoFile;$AudioFileModelCopyWith<$Res>? get audioFile;

}
/// @nodoc
class _$FileModelCopyWithImpl<$Res>
    implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._self, this._then);

  final FileModel _self;
  final $Res Function(FileModel) _then;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileId = freezed,Object? url = freezed,Object? type = freezed,Object? mimeType = freezed,Object? originalName = freezed,Object? createdAt = freezed,Object? videoFile = freezed,Object? audioFile = freezed,}) {
  return _then(_self.copyWith(
fileId: freezed == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as int?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,videoFile: freezed == videoFile ? _self.videoFile : videoFile // ignore: cast_nullable_to_non_nullable
as VideoFileModel?,audioFile: freezed == audioFile ? _self.audioFile : audioFile // ignore: cast_nullable_to_non_nullable
as AudioFileModel?,
  ));
}
/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VideoFileModelCopyWith<$Res>? get videoFile {
    if (_self.videoFile == null) {
    return null;
  }

  return $VideoFileModelCopyWith<$Res>(_self.videoFile!, (value) {
    return _then(_self.copyWith(videoFile: value));
  });
}/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioFileModelCopyWith<$Res>? get audioFile {
    if (_self.audioFile == null) {
    return null;
  }

  return $AudioFileModelCopyWith<$Res>(_self.audioFile!, (value) {
    return _then(_self.copyWith(audioFile: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _FileModel implements FileModel {
  const _FileModel({this.fileId, this.url, this.type, this.mimeType, this.originalName, this.createdAt, this.videoFile, this.audioFile});
  factory _FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);

@override final  int? fileId;
@override final  String? url;
@override final  String? type;
@override final  String? mimeType;
@override final  String? originalName;
@override final  int? createdAt;
@override final  VideoFileModel? videoFile;
@override final  AudioFileModel? audioFile;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileModelCopyWith<_FileModel> get copyWith => __$FileModelCopyWithImpl<_FileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileModel&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.videoFile, videoFile) || other.videoFile == videoFile)&&(identical(other.audioFile, audioFile) || other.audioFile == audioFile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId,url,type,mimeType,originalName,createdAt,videoFile,audioFile);

@override
String toString() {
  return 'FileModel(fileId: $fileId, url: $url, type: $type, mimeType: $mimeType, originalName: $originalName, createdAt: $createdAt, videoFile: $videoFile, audioFile: $audioFile)';
}


}

/// @nodoc
abstract mixin class _$FileModelCopyWith<$Res> implements $FileModelCopyWith<$Res> {
  factory _$FileModelCopyWith(_FileModel value, $Res Function(_FileModel) _then) = __$FileModelCopyWithImpl;
@override @useResult
$Res call({
 int? fileId, String? url, String? type, String? mimeType, String? originalName, int? createdAt, VideoFileModel? videoFile, AudioFileModel? audioFile
});


@override $VideoFileModelCopyWith<$Res>? get videoFile;@override $AudioFileModelCopyWith<$Res>? get audioFile;

}
/// @nodoc
class __$FileModelCopyWithImpl<$Res>
    implements _$FileModelCopyWith<$Res> {
  __$FileModelCopyWithImpl(this._self, this._then);

  final _FileModel _self;
  final $Res Function(_FileModel) _then;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileId = freezed,Object? url = freezed,Object? type = freezed,Object? mimeType = freezed,Object? originalName = freezed,Object? createdAt = freezed,Object? videoFile = freezed,Object? audioFile = freezed,}) {
  return _then(_FileModel(
fileId: freezed == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as int?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,videoFile: freezed == videoFile ? _self.videoFile : videoFile // ignore: cast_nullable_to_non_nullable
as VideoFileModel?,audioFile: freezed == audioFile ? _self.audioFile : audioFile // ignore: cast_nullable_to_non_nullable
as AudioFileModel?,
  ));
}

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VideoFileModelCopyWith<$Res>? get videoFile {
    if (_self.videoFile == null) {
    return null;
  }

  return $VideoFileModelCopyWith<$Res>(_self.videoFile!, (value) {
    return _then(_self.copyWith(videoFile: value));
  });
}/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioFileModelCopyWith<$Res>? get audioFile {
    if (_self.audioFile == null) {
    return null;
  }

  return $AudioFileModelCopyWith<$Res>(_self.audioFile!, (value) {
    return _then(_self.copyWith(audioFile: value));
  });
}
}


/// @nodoc
mixin _$VideoFileModel {

 VideoPreviewImageFileModel? get videoPreviewImageFile; int? get width; int? get height; double? get duration;
/// Create a copy of VideoFileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoFileModelCopyWith<VideoFileModel> get copyWith => _$VideoFileModelCopyWithImpl<VideoFileModel>(this as VideoFileModel, _$identity);

  /// Serializes this VideoFileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoFileModel&&(identical(other.videoPreviewImageFile, videoPreviewImageFile) || other.videoPreviewImageFile == videoPreviewImageFile)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoPreviewImageFile,width,height,duration);

@override
String toString() {
  return 'VideoFileModel(videoPreviewImageFile: $videoPreviewImageFile, width: $width, height: $height, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $VideoFileModelCopyWith<$Res>  {
  factory $VideoFileModelCopyWith(VideoFileModel value, $Res Function(VideoFileModel) _then) = _$VideoFileModelCopyWithImpl;
@useResult
$Res call({
 VideoPreviewImageFileModel? videoPreviewImageFile, int? width, int? height, double? duration
});


$VideoPreviewImageFileModelCopyWith<$Res>? get videoPreviewImageFile;

}
/// @nodoc
class _$VideoFileModelCopyWithImpl<$Res>
    implements $VideoFileModelCopyWith<$Res> {
  _$VideoFileModelCopyWithImpl(this._self, this._then);

  final VideoFileModel _self;
  final $Res Function(VideoFileModel) _then;

/// Create a copy of VideoFileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videoPreviewImageFile = freezed,Object? width = freezed,Object? height = freezed,Object? duration = freezed,}) {
  return _then(_self.copyWith(
videoPreviewImageFile: freezed == videoPreviewImageFile ? _self.videoPreviewImageFile : videoPreviewImageFile // ignore: cast_nullable_to_non_nullable
as VideoPreviewImageFileModel?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of VideoFileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VideoPreviewImageFileModelCopyWith<$Res>? get videoPreviewImageFile {
    if (_self.videoPreviewImageFile == null) {
    return null;
  }

  return $VideoPreviewImageFileModelCopyWith<$Res>(_self.videoPreviewImageFile!, (value) {
    return _then(_self.copyWith(videoPreviewImageFile: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _VideoFileModel implements VideoFileModel {
  const _VideoFileModel({this.videoPreviewImageFile, this.width, this.height, this.duration});
  factory _VideoFileModel.fromJson(Map<String, dynamic> json) => _$VideoFileModelFromJson(json);

@override final  VideoPreviewImageFileModel? videoPreviewImageFile;
@override final  int? width;
@override final  int? height;
@override final  double? duration;

/// Create a copy of VideoFileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoFileModelCopyWith<_VideoFileModel> get copyWith => __$VideoFileModelCopyWithImpl<_VideoFileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoFileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoFileModel&&(identical(other.videoPreviewImageFile, videoPreviewImageFile) || other.videoPreviewImageFile == videoPreviewImageFile)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoPreviewImageFile,width,height,duration);

@override
String toString() {
  return 'VideoFileModel(videoPreviewImageFile: $videoPreviewImageFile, width: $width, height: $height, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$VideoFileModelCopyWith<$Res> implements $VideoFileModelCopyWith<$Res> {
  factory _$VideoFileModelCopyWith(_VideoFileModel value, $Res Function(_VideoFileModel) _then) = __$VideoFileModelCopyWithImpl;
@override @useResult
$Res call({
 VideoPreviewImageFileModel? videoPreviewImageFile, int? width, int? height, double? duration
});


@override $VideoPreviewImageFileModelCopyWith<$Res>? get videoPreviewImageFile;

}
/// @nodoc
class __$VideoFileModelCopyWithImpl<$Res>
    implements _$VideoFileModelCopyWith<$Res> {
  __$VideoFileModelCopyWithImpl(this._self, this._then);

  final _VideoFileModel _self;
  final $Res Function(_VideoFileModel) _then;

/// Create a copy of VideoFileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videoPreviewImageFile = freezed,Object? width = freezed,Object? height = freezed,Object? duration = freezed,}) {
  return _then(_VideoFileModel(
videoPreviewImageFile: freezed == videoPreviewImageFile ? _self.videoPreviewImageFile : videoPreviewImageFile // ignore: cast_nullable_to_non_nullable
as VideoPreviewImageFileModel?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of VideoFileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VideoPreviewImageFileModelCopyWith<$Res>? get videoPreviewImageFile {
    if (_self.videoPreviewImageFile == null) {
    return null;
  }

  return $VideoPreviewImageFileModelCopyWith<$Res>(_self.videoPreviewImageFile!, (value) {
    return _then(_self.copyWith(videoPreviewImageFile: value));
  });
}
}


/// @nodoc
mixin _$VideoPreviewImageFileModel {

 String? get url; String? get previewUrl; int? get width; String? get blurHash; int? get height; int? get previewWidth; int? get previewHeight;
/// Create a copy of VideoPreviewImageFileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoPreviewImageFileModelCopyWith<VideoPreviewImageFileModel> get copyWith => _$VideoPreviewImageFileModelCopyWithImpl<VideoPreviewImageFileModel>(this as VideoPreviewImageFileModel, _$identity);

  /// Serializes this VideoPreviewImageFileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoPreviewImageFileModel&&(identical(other.url, url) || other.url == url)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.width, width) || other.width == width)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.height, height) || other.height == height)&&(identical(other.previewWidth, previewWidth) || other.previewWidth == previewWidth)&&(identical(other.previewHeight, previewHeight) || other.previewHeight == previewHeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,previewUrl,width,blurHash,height,previewWidth,previewHeight);

@override
String toString() {
  return 'VideoPreviewImageFileModel(url: $url, previewUrl: $previewUrl, width: $width, blurHash: $blurHash, height: $height, previewWidth: $previewWidth, previewHeight: $previewHeight)';
}


}

/// @nodoc
abstract mixin class $VideoPreviewImageFileModelCopyWith<$Res>  {
  factory $VideoPreviewImageFileModelCopyWith(VideoPreviewImageFileModel value, $Res Function(VideoPreviewImageFileModel) _then) = _$VideoPreviewImageFileModelCopyWithImpl;
@useResult
$Res call({
 String? url, String? previewUrl, int? width, String? blurHash, int? height, int? previewWidth, int? previewHeight
});




}
/// @nodoc
class _$VideoPreviewImageFileModelCopyWithImpl<$Res>
    implements $VideoPreviewImageFileModelCopyWith<$Res> {
  _$VideoPreviewImageFileModelCopyWithImpl(this._self, this._then);

  final VideoPreviewImageFileModel _self;
  final $Res Function(VideoPreviewImageFileModel) _then;

/// Create a copy of VideoPreviewImageFileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? previewUrl = freezed,Object? width = freezed,Object? blurHash = freezed,Object? height = freezed,Object? previewWidth = freezed,Object? previewHeight = freezed,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,blurHash: freezed == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,previewWidth: freezed == previewWidth ? _self.previewWidth : previewWidth // ignore: cast_nullable_to_non_nullable
as int?,previewHeight: freezed == previewHeight ? _self.previewHeight : previewHeight // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VideoPreviewImageFileModel implements VideoPreviewImageFileModel {
  const _VideoPreviewImageFileModel({this.url, this.previewUrl, this.width, this.blurHash, this.height, this.previewWidth, this.previewHeight});
  factory _VideoPreviewImageFileModel.fromJson(Map<String, dynamic> json) => _$VideoPreviewImageFileModelFromJson(json);

@override final  String? url;
@override final  String? previewUrl;
@override final  int? width;
@override final  String? blurHash;
@override final  int? height;
@override final  int? previewWidth;
@override final  int? previewHeight;

/// Create a copy of VideoPreviewImageFileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoPreviewImageFileModelCopyWith<_VideoPreviewImageFileModel> get copyWith => __$VideoPreviewImageFileModelCopyWithImpl<_VideoPreviewImageFileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoPreviewImageFileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoPreviewImageFileModel&&(identical(other.url, url) || other.url == url)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.width, width) || other.width == width)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.height, height) || other.height == height)&&(identical(other.previewWidth, previewWidth) || other.previewWidth == previewWidth)&&(identical(other.previewHeight, previewHeight) || other.previewHeight == previewHeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,previewUrl,width,blurHash,height,previewWidth,previewHeight);

@override
String toString() {
  return 'VideoPreviewImageFileModel(url: $url, previewUrl: $previewUrl, width: $width, blurHash: $blurHash, height: $height, previewWidth: $previewWidth, previewHeight: $previewHeight)';
}


}

/// @nodoc
abstract mixin class _$VideoPreviewImageFileModelCopyWith<$Res> implements $VideoPreviewImageFileModelCopyWith<$Res> {
  factory _$VideoPreviewImageFileModelCopyWith(_VideoPreviewImageFileModel value, $Res Function(_VideoPreviewImageFileModel) _then) = __$VideoPreviewImageFileModelCopyWithImpl;
@override @useResult
$Res call({
 String? url, String? previewUrl, int? width, String? blurHash, int? height, int? previewWidth, int? previewHeight
});




}
/// @nodoc
class __$VideoPreviewImageFileModelCopyWithImpl<$Res>
    implements _$VideoPreviewImageFileModelCopyWith<$Res> {
  __$VideoPreviewImageFileModelCopyWithImpl(this._self, this._then);

  final _VideoPreviewImageFileModel _self;
  final $Res Function(_VideoPreviewImageFileModel) _then;

/// Create a copy of VideoPreviewImageFileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? previewUrl = freezed,Object? width = freezed,Object? blurHash = freezed,Object? height = freezed,Object? previewWidth = freezed,Object? previewHeight = freezed,}) {
  return _then(_VideoPreviewImageFileModel(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,blurHash: freezed == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,previewWidth: freezed == previewWidth ? _self.previewWidth : previewWidth // ignore: cast_nullable_to_non_nullable
as int?,previewHeight: freezed == previewHeight ? _self.previewHeight : previewHeight // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AudioFileModel {

 double? get duration;
/// Create a copy of AudioFileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioFileModelCopyWith<AudioFileModel> get copyWith => _$AudioFileModelCopyWithImpl<AudioFileModel>(this as AudioFileModel, _$identity);

  /// Serializes this AudioFileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioFileModel&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'AudioFileModel(duration: $duration)';
}


}

/// @nodoc
abstract mixin class $AudioFileModelCopyWith<$Res>  {
  factory $AudioFileModelCopyWith(AudioFileModel value, $Res Function(AudioFileModel) _then) = _$AudioFileModelCopyWithImpl;
@useResult
$Res call({
 double? duration
});




}
/// @nodoc
class _$AudioFileModelCopyWithImpl<$Res>
    implements $AudioFileModelCopyWith<$Res> {
  _$AudioFileModelCopyWithImpl(this._self, this._then);

  final AudioFileModel _self;
  final $Res Function(AudioFileModel) _then;

/// Create a copy of AudioFileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? duration = freezed,}) {
  return _then(_self.copyWith(
duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AudioFileModel implements AudioFileModel {
  const _AudioFileModel({this.duration});
  factory _AudioFileModel.fromJson(Map<String, dynamic> json) => _$AudioFileModelFromJson(json);

@override final  double? duration;

/// Create a copy of AudioFileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioFileModelCopyWith<_AudioFileModel> get copyWith => __$AudioFileModelCopyWithImpl<_AudioFileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioFileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioFileModel&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'AudioFileModel(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$AudioFileModelCopyWith<$Res> implements $AudioFileModelCopyWith<$Res> {
  factory _$AudioFileModelCopyWith(_AudioFileModel value, $Res Function(_AudioFileModel) _then) = __$AudioFileModelCopyWithImpl;
@override @useResult
$Res call({
 double? duration
});




}
/// @nodoc
class __$AudioFileModelCopyWithImpl<$Res>
    implements _$AudioFileModelCopyWith<$Res> {
  __$AudioFileModelCopyWithImpl(this._self, this._then);

  final _AudioFileModel _self;
  final $Res Function(_AudioFileModel) _then;

/// Create a copy of AudioFileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? duration = freezed,}) {
  return _then(_AudioFileModel(
duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$UserModel {

 int? get userId; String? get name; String? get avatar; int? get toRelationStatus; int? get fromRelationStatus;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.toRelationStatus, toRelationStatus) || other.toRelationStatus == toRelationStatus)&&(identical(other.fromRelationStatus, fromRelationStatus) || other.fromRelationStatus == fromRelationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,avatar,toRelationStatus,fromRelationStatus);

@override
String toString() {
  return 'UserModel(userId: $userId, name: $name, avatar: $avatar, toRelationStatus: $toRelationStatus, fromRelationStatus: $fromRelationStatus)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 int? userId, String? name, String? avatar, int? toRelationStatus, int? fromRelationStatus
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? name = freezed,Object? avatar = freezed,Object? toRelationStatus = freezed,Object? fromRelationStatus = freezed,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,toRelationStatus: freezed == toRelationStatus ? _self.toRelationStatus : toRelationStatus // ignore: cast_nullable_to_non_nullable
as int?,fromRelationStatus: freezed == fromRelationStatus ? _self.fromRelationStatus : fromRelationStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({this.userId, this.name, this.avatar, this.toRelationStatus, this.fromRelationStatus});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  int? userId;
@override final  String? name;
@override final  String? avatar;
@override final  int? toRelationStatus;
@override final  int? fromRelationStatus;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.toRelationStatus, toRelationStatus) || other.toRelationStatus == toRelationStatus)&&(identical(other.fromRelationStatus, fromRelationStatus) || other.fromRelationStatus == fromRelationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,avatar,toRelationStatus,fromRelationStatus);

@override
String toString() {
  return 'UserModel(userId: $userId, name: $name, avatar: $avatar, toRelationStatus: $toRelationStatus, fromRelationStatus: $fromRelationStatus)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 int? userId, String? name, String? avatar, int? toRelationStatus, int? fromRelationStatus
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? name = freezed,Object? avatar = freezed,Object? toRelationStatus = freezed,Object? fromRelationStatus = freezed,}) {
  return _then(_UserModel(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,toRelationStatus: freezed == toRelationStatus ? _self.toRelationStatus : toRelationStatus // ignore: cast_nullable_to_non_nullable
as int?,fromRelationStatus: freezed == fromRelationStatus ? _self.fromRelationStatus : fromRelationStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
