import 'package:story_app/data/model/story.dart';

class StoryDetailResponse {
  final bool error;
  final String message;
  final Story story;

  StoryDetailResponse({
    required this.error,
    required this.message,
    required this.story,
  });

  factory StoryDetailResponse.fromJson(Map<String, dynamic> json) {
    return StoryDetailResponse(
      error: json['error'],
      message: json['message'],
      story: Story.fromJson(json['Story']),
    );
  }
}