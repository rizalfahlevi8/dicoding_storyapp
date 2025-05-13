// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadResponse {

 bool get error; String get message;
/// Create a copy of UploadResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadResponseCopyWith<UploadResponse> get copyWith => _$UploadResponseCopyWithImpl<UploadResponse>(this as UploadResponse, _$identity);

  /// Serializes this UploadResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadResponse&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message);

@override
String toString() {
  return 'UploadResponse(error: $error, message: $message)';
}


}

/// @nodoc
abstract mixin class $UploadResponseCopyWith<$Res>  {
  factory $UploadResponseCopyWith(UploadResponse value, $Res Function(UploadResponse) _then) = _$UploadResponseCopyWithImpl;
@useResult
$Res call({
 bool error, String message
});




}
/// @nodoc
class _$UploadResponseCopyWithImpl<$Res>
    implements $UploadResponseCopyWith<$Res> {
  _$UploadResponseCopyWithImpl(this._self, this._then);

  final UploadResponse _self;
  final $Res Function(UploadResponse) _then;

/// Create a copy of UploadResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? message = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UploadResponse implements UploadResponse {
  const _UploadResponse({required this.error, required this.message});
  factory _UploadResponse.fromJson(Map<String, dynamic> json) => _$UploadResponseFromJson(json);

@override final  bool error;
@override final  String message;

/// Create a copy of UploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadResponseCopyWith<_UploadResponse> get copyWith => __$UploadResponseCopyWithImpl<_UploadResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadResponse&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message);

@override
String toString() {
  return 'UploadResponse(error: $error, message: $message)';
}


}

/// @nodoc
abstract mixin class _$UploadResponseCopyWith<$Res> implements $UploadResponseCopyWith<$Res> {
  factory _$UploadResponseCopyWith(_UploadResponse value, $Res Function(_UploadResponse) _then) = __$UploadResponseCopyWithImpl;
@override @useResult
$Res call({
 bool error, String message
});




}
/// @nodoc
class __$UploadResponseCopyWithImpl<$Res>
    implements _$UploadResponseCopyWith<$Res> {
  __$UploadResponseCopyWithImpl(this._self, this._then);

  final _UploadResponse _self;
  final $Res Function(_UploadResponse) _then;

/// Create a copy of UploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? message = null,}) {
  return _then(_UploadResponse(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
