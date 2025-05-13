import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/data/model/story.dart';
 
part 'story_detail_response.g.dart';
part 'story_detail_response.freezed.dart';
 
@freezed
abstract class StoryDetailResponse with _$StoryDetailResponse{
  const factory StoryDetailResponse({
    required bool error,
    required String message,
    required Story story,
  }) = _StoryDetailResponse;

  
  factory StoryDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryDetailResponseFromJson(json);


}