// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_view_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatViewModelState {

 ChatLoadState get loadState; List<MessageModel> get messages; String? get errorMessage;
/// Create a copy of ChatViewModelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatViewModelStateCopyWith<ChatViewModelState> get copyWith => _$ChatViewModelStateCopyWithImpl<ChatViewModelState>(this as ChatViewModelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatViewModelState&&(identical(other.loadState, loadState) || other.loadState == loadState)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loadState,const DeepCollectionEquality().hash(messages),errorMessage);

@override
String toString() {
  return 'ChatViewModelState(loadState: $loadState, messages: $messages, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ChatViewModelStateCopyWith<$Res>  {
  factory $ChatViewModelStateCopyWith(ChatViewModelState value, $Res Function(ChatViewModelState) _then) = _$ChatViewModelStateCopyWithImpl;
@useResult
$Res call({
 ChatLoadState loadState, List<MessageModel> messages, String? errorMessage
});




}
/// @nodoc
class _$ChatViewModelStateCopyWithImpl<$Res>
    implements $ChatViewModelStateCopyWith<$Res> {
  _$ChatViewModelStateCopyWithImpl(this._self, this._then);

  final ChatViewModelState _self;
  final $Res Function(ChatViewModelState) _then;

/// Create a copy of ChatViewModelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadState = null,Object? messages = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
loadState: null == loadState ? _self.loadState : loadState // ignore: cast_nullable_to_non_nullable
as ChatLoadState,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _ChatViewModelState implements ChatViewModelState {
  const _ChatViewModelState({required this.loadState, required final  List<MessageModel> messages, this.errorMessage}): _messages = messages;
  

@override final  ChatLoadState loadState;
 final  List<MessageModel> _messages;
@override List<MessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  String? errorMessage;

/// Create a copy of ChatViewModelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatViewModelStateCopyWith<_ChatViewModelState> get copyWith => __$ChatViewModelStateCopyWithImpl<_ChatViewModelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatViewModelState&&(identical(other.loadState, loadState) || other.loadState == loadState)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loadState,const DeepCollectionEquality().hash(_messages),errorMessage);

@override
String toString() {
  return 'ChatViewModelState(loadState: $loadState, messages: $messages, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ChatViewModelStateCopyWith<$Res> implements $ChatViewModelStateCopyWith<$Res> {
  factory _$ChatViewModelStateCopyWith(_ChatViewModelState value, $Res Function(_ChatViewModelState) _then) = __$ChatViewModelStateCopyWithImpl;
@override @useResult
$Res call({
 ChatLoadState loadState, List<MessageModel> messages, String? errorMessage
});




}
/// @nodoc
class __$ChatViewModelStateCopyWithImpl<$Res>
    implements _$ChatViewModelStateCopyWith<$Res> {
  __$ChatViewModelStateCopyWithImpl(this._self, this._then);

  final _ChatViewModelState _self;
  final $Res Function(_ChatViewModelState) _then;

/// Create a copy of ChatViewModelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadState = null,Object? messages = null,Object? errorMessage = freezed,}) {
  return _then(_ChatViewModelState(
loadState: null == loadState ? _self.loadState : loadState // ignore: cast_nullable_to_non_nullable
as ChatLoadState,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
