import 'package:story_app/data/model/story.dart';

sealed class StoryListResultState {}

class StoryListNoneState extends StoryListResultState {}

class StoryListLoadingState extends StoryListResultState {}

class StoryListErrorState extends StoryListResultState {
  final String error;

  StoryListErrorState(this.error);
}

class StoryListResultLoadedState extends StoryListResultState {
  final List<Story> data;

  StoryListResultLoadedState(this.data);
}
