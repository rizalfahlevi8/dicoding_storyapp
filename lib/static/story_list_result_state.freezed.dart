// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_list_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoryListResultState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryListResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoryListResultState()';
}


}

/// @nodoc
class $StoryListResultStateCopyWith<$Res>  {
$StoryListResultStateCopyWith(StoryListResultState _, $Res Function(StoryListResultState) __);
}


/// @nodoc


class StoryListNoneState implements StoryListResultState {
  const StoryListNoneState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryListNoneState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoryListResultState.none()';
}


}




/// @nodoc


class StoryListLoadingState implements StoryListResultState {
  const StoryListLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryListLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoryListResultState.loading()';
}


}




/// @nodoc


class StoryListErrorState implements StoryListResultState {
  const StoryListErrorState(this.error);
  

 final  String error;

/// Create a copy of StoryListResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryListErrorStateCopyWith<StoryListErrorState> get copyWith => _$StoryListErrorStateCopyWithImpl<StoryListErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryListErrorState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'StoryListResultState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $StoryListErrorStateCopyWith<$Res> implements $StoryListResultStateCopyWith<$Res> {
  factory $StoryListErrorStateCopyWith(StoryListErrorState value, $Res Function(StoryListErrorState) _then) = _$StoryListErrorStateCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$StoryListErrorStateCopyWithImpl<$Res>
    implements $StoryListErrorStateCopyWith<$Res> {
  _$StoryListErrorStateCopyWithImpl(this._self, this._then);

  final StoryListErrorState _self;
  final $Res Function(StoryListErrorState) _then;

/// Create a copy of StoryListResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(StoryListErrorState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StoryListResultLoadedState implements StoryListResultState {
  const StoryListResultLoadedState(final  List<Story> data): _data = data;
  

 final  List<Story> _data;
 List<Story> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of StoryListResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryListResultLoadedStateCopyWith<StoryListResultLoadedState> get copyWith => _$StoryListResultLoadedStateCopyWithImpl<StoryListResultLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryListResultLoadedState&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'StoryListResultState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $StoryListResultLoadedStateCopyWith<$Res> implements $StoryListResultStateCopyWith<$Res> {
  factory $StoryListResultLoadedStateCopyWith(StoryListResultLoadedState value, $Res Function(StoryListResultLoadedState) _then) = _$StoryListResultLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<Story> data
});




}
/// @nodoc
class _$StoryListResultLoadedStateCopyWithImpl<$Res>
    implements $StoryListResultLoadedStateCopyWith<$Res> {
  _$StoryListResultLoadedStateCopyWithImpl(this._self, this._then);

  final StoryListResultLoadedState _self;
  final $Res Function(StoryListResultLoadedState) _then;

/// Create a copy of StoryListResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(StoryListResultLoadedState(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Story>,
  ));
}


}

// dart format on
