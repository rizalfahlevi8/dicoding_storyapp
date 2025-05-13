// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoryListResponse {

 bool get error; String get message;@JsonKey(name: "listStory") List<Story> get listStory;
/// Create a copy of StoryListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryListResponseCopyWith<StoryListResponse> get copyWith => _$StoryListResponseCopyWithImpl<StoryListResponse>(this as StoryListResponse, _$identity);

  /// Serializes this StoryListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryListResponse&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.listStory, listStory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,const DeepCollectionEquality().hash(listStory));

@override
String toString() {
  return 'StoryListResponse(error: $error, message: $message, listStory: $listStory)';
}


}

/// @nodoc
abstract mixin class $StoryListResponseCopyWith<$Res>  {
  factory $StoryListResponseCopyWith(StoryListResponse value, $Res Function(StoryListResponse) _then) = _$StoryListResponseCopyWithImpl;
@useResult
$Res call({
 bool error, String message,@JsonKey(name: "listStory") List<Story> listStory
});




}
/// @nodoc
class _$StoryListResponseCopyWithImpl<$Res>
    implements $StoryListResponseCopyWith<$Res> {
  _$StoryListResponseCopyWithImpl(this._self, this._then);

  final StoryListResponse _self;
  final $Res Function(StoryListResponse) _then;

/// Create a copy of StoryListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? message = null,Object? listStory = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,listStory: null == listStory ? _self.listStory : listStory // ignore: cast_nullable_to_non_nullable
as List<Story>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StoryListResponse implements StoryListResponse {
  const _StoryListResponse({required this.error, required this.message, @JsonKey(name: "listStory") required final  List<Story> listStory}): _listStory = listStory;
  factory _StoryListResponse.fromJson(Map<String, dynamic> json) => _$StoryListResponseFromJson(json);

@override final  bool error;
@override final  String message;
 final  List<Story> _listStory;
@override@JsonKey(name: "listStory") List<Story> get listStory {
  if (_listStory is EqualUnmodifiableListView) return _listStory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listStory);
}


/// Create a copy of StoryListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryListResponseCopyWith<_StoryListResponse> get copyWith => __$StoryListResponseCopyWithImpl<_StoryListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryListResponse&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._listStory, _listStory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,const DeepCollectionEquality().hash(_listStory));

@override
String toString() {
  return 'StoryListResponse(error: $error, message: $message, listStory: $listStory)';
}


}

/// @nodoc
abstract mixin class _$StoryListResponseCopyWith<$Res> implements $StoryListResponseCopyWith<$Res> {
  factory _$StoryListResponseCopyWith(_StoryListResponse value, $Res Function(_StoryListResponse) _then) = __$StoryListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool error, String message,@JsonKey(name: "listStory") List<Story> listStory
});




}
/// @nodoc
class __$StoryListResponseCopyWithImpl<$Res>
    implements _$StoryListResponseCopyWith<$Res> {
  __$StoryListResponseCopyWithImpl(this._self, this._then);

  final _StoryListResponse _self;
  final $Res Function(_StoryListResponse) _then;

/// Create a copy of StoryListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? message = null,Object? listStory = null,}) {
  return _then(_StoryListResponse(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,listStory: null == listStory ? _self._listStory : listStory // ignore: cast_nullable_to_non_nullable
as List<Story>,
  ));
}


}

// dart format on
