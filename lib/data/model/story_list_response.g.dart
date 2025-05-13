// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoryListResponse _$StoryListResponseFromJson(Map<String, dynamic> json) =>
    _StoryListResponse(
      error: json['error'] as bool,
      message: json['message'] as String,
      listStory:
          (json['listStory'] as List<dynamic>)
              .map((e) => Story.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$StoryListResponseToJson(_StoryListResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.listStory,
    };
