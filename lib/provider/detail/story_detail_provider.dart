import 'package:flutter/material.dart';
import 'package:story_app/data/api/api_story.dart';
import 'package:story_app/static/story_detail_result_state.dart';

class StoryDetailProvider extends ChangeNotifier {
  final ApiStory _apiStory;

  StoryDetailProvider(this._apiStory);

  StoryDetailResultState _resultState = StoryDetailNoneState();
  StoryDetailResultState get resultState => _resultState;

  Future<void> fetchStoryDetail(String id) async {
    try {
      _resultState = StoryDetailLoadingState();
      notifyListeners();

      final result = await _apiStory.getStoryDetail(id);

      if (result.error) {
        _resultState = StoryDetailErrorState(result.message);
      } else {
        _resultState = StoryDetailLoadedState(result.story);
      }

      notifyListeners();
    } on Exception catch (_) {
      _resultState = StoryDetailErrorState(
        'Tidak dapat terhubung ke internet. Periksa koneksi Anda dan coba lagi.',
      );
      notifyListeners();
    }
  }
}
