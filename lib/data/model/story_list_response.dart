import 'package:story_app/data/model/story.dart';

class StoryListResponse {
  final bool error;
  final String message;
  final List<Story> listStory;

  const StoryListResponse({
    required this.error,
    required this.message,
    required this.listStory,
  });

  factory StoryListResponse.fromJson(Map<String, dynamic> json) {
    return StoryListResponse(
      error:  json['error'],
      message: json['message'],
      listStory: List<Story>.from(
        json['listStory']!.map(
          (story) => Story.fromJson(story),
        ),
      ),
    );
  }
}