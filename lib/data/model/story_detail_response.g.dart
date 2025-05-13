// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoryDetailResponse _$StoryDetailResponseFromJson(Map<String, dynamic> json) =>
    _StoryDetailResponse(
      error: json['error'] as bool,
      message: json['message'] as String,
      story: Story.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoryDetailResponseToJson(
  _StoryDetailResponse instance,
) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
  'story': instance.story,
};
