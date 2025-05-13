// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageConfiguration {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageConfiguration);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageConfiguration()';
}


}

/// @nodoc
class $PageConfigurationCopyWith<$Res>  {
$PageConfigurationCopyWith(PageConfiguration _, $Res Function(PageConfiguration) __);
}


/// @nodoc


class SplashPageConfiguration implements PageConfiguration {
  const SplashPageConfiguration();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashPageConfiguration);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageConfiguration.splash()';
}


}




/// @nodoc


class LoginPageConfiguration implements PageConfiguration {
  const LoginPageConfiguration();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPageConfiguration);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageConfiguration.login()';
}


}




/// @nodoc


class RegisterPageConfiguration implements PageConfiguration {
  const RegisterPageConfiguration();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterPageConfiguration);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageConfiguration.register()';
}


}




/// @nodoc


class HomePageConfiguration implements PageConfiguration {
  const HomePageConfiguration();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageConfiguration);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageConfiguration.home()';
}


}




/// @nodoc


class DetailStoryPageConfiguration implements PageConfiguration {
  const DetailStoryPageConfiguration({this.storyId});
  

 final  String? storyId;

/// Create a copy of PageConfiguration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailStoryPageConfigurationCopyWith<DetailStoryPageConfiguration> get copyWith => _$DetailStoryPageConfigurationCopyWithImpl<DetailStoryPageConfiguration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailStoryPageConfiguration&&(identical(other.storyId, storyId) || other.storyId == storyId));
}


@override
int get hashCode => Object.hash(runtimeType,storyId);

@override
String toString() {
  return 'PageConfiguration.detailStory(storyId: $storyId)';
}


}

/// @nodoc
abstract mixin class $DetailStoryPageConfigurationCopyWith<$Res> implements $PageConfigurationCopyWith<$Res> {
  factory $DetailStoryPageConfigurationCopyWith(DetailStoryPageConfiguration value, $Res Function(DetailStoryPageConfiguration) _then) = _$DetailStoryPageConfigurationCopyWithImpl;
@useResult
$Res call({
 String? storyId
});




}
/// @nodoc
class _$DetailStoryPageConfigurationCopyWithImpl<$Res>
    implements $DetailStoryPageConfigurationCopyWith<$Res> {
  _$DetailStoryPageConfigurationCopyWithImpl(this._self, this._then);

  final DetailStoryPageConfiguration _self;
  final $Res Function(DetailStoryPageConfiguration) _then;

/// Create a copy of PageConfiguration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? storyId = freezed,}) {
  return _then(DetailStoryPageConfiguration(
storyId: freezed == storyId ? _self.storyId : storyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UnknownPageConfiguration implements PageConfiguration {
  const UnknownPageConfiguration();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownPageConfiguration);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageConfiguration.unknown()';
}


}




// dart format on
