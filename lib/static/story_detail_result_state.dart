import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/data/model/story.dart';

part 'story_detail_result_state.freezed.dart';

@freezed
sealed class StoryDetailResultState with _$StoryDetailResultState {
  const factory StoryDetailResultState.none() = StoryDetailNoneState;
  const factory StoryDetailResultState.loading() = StoryDetailLoadingState;
  const factory StoryDetailResultState.error(String error) = StoryDetailErrorState;
  const factory StoryDetailResultState.loaded(Story data) = StoryDetailLoadedState;
}
