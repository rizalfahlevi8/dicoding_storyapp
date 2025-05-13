// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_detail_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoryDetailResultState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryDetailResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoryDetailResultState()';
}


}

/// @nodoc
class $StoryDetailResultStateCopyWith<$Res>  {
$StoryDetailResultStateCopyWith(StoryDetailResultState _, $Res Function(StoryDetailResultState) __);
}


/// @nodoc


class StoryDetailNoneState implements StoryDetailResultState {
  const StoryDetailNoneState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryDetailNoneState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoryDetailResultState.none()';
}


}




/// @nodoc


class StoryDetailLoadingState implements StoryDetailResultState {
  const StoryDetailLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryDetailLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoryDetailResultState.loading()';
}


}




/// @nodoc


class StoryDetailErrorState implements StoryDetailResultState {
  const StoryDetailErrorState(this.error);
  

 final  String error;

/// Create a copy of StoryDetailResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryDetailErrorStateCopyWith<StoryDetailErrorState> get copyWith => _$StoryDetailErrorStateCopyWithImpl<StoryDetailErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryDetailErrorState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'StoryDetailResultState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $StoryDetailErrorStateCopyWith<$Res> implements $StoryDetailResultStateCopyWith<$Res> {
  factory $StoryDetailErrorStateCopyWith(StoryDetailErrorState value, $Res Function(StoryDetailErrorState) _then) = _$StoryDetailErrorStateCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$StoryDetailErrorStateCopyWithImpl<$Res>
    implements $StoryDetailErrorStateCopyWith<$Res> {
  _$StoryDetailErrorStateCopyWithImpl(this._self, this._then);

  final StoryDetailErrorState _self;
  final $Res Function(StoryDetailErrorState) _then;

/// Create a copy of StoryDetailResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(StoryDetailErrorState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StoryDetailLoadedState implements StoryDetailResultState {
  const StoryDetailLoadedState(this.data);
  

 final  Story data;

/// Create a copy of StoryDetailResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryDetailLoadedStateCopyWith<StoryDetailLoadedState> get copyWith => _$StoryDetailLoadedStateCopyWithImpl<StoryDetailLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryDetailLoadedState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'StoryDetailResultState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $StoryDetailLoadedStateCopyWith<$Res> implements $StoryDetailResultStateCopyWith<$Res> {
  factory $StoryDetailLoadedStateCopyWith(StoryDetailLoadedState value, $Res Function(StoryDetailLoadedState) _then) = _$StoryDetailLoadedStateCopyWithImpl;
@useResult
$Res call({
 Story data
});


$StoryCopyWith<$Res> get data;

}
/// @nodoc
class _$StoryDetailLoadedStateCopyWithImpl<$Res>
    implements $StoryDetailLoadedStateCopyWith<$Res> {
  _$StoryDetailLoadedStateCopyWithImpl(this._self, this._then);

  final StoryDetailLoadedState _self;
  final $Res Function(StoryDetailLoadedState) _then;

/// Create a copy of StoryDetailResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(StoryDetailLoadedState(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Story,
  ));
}

/// Create a copy of StoryDetailResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryCopyWith<$Res> get data {
  
  return $StoryCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
