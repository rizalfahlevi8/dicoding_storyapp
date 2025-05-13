import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/data/model/story.dart';

part 'story_list_result_state.freezed.dart';

@freezed
sealed class StoryListResultState with _$StoryListResultState {
  const factory StoryListResultState.none() = StoryListNoneState;
  const factory StoryListResultState.loading() = StoryListLoadingState;
  const factory StoryListResultState.error(String error) = StoryListErrorState;
  const factory StoryListResultState.loaded(List<Story> data) = StoryListResultLoadedState;
}
