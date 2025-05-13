import 'package:flutter/material.dart';
import 'package:story_app/data/api/api_story.dart';
import 'package:story_app/static/story_detail_result_state.dart';

class StoryDetailProvider extends ChangeNotifier {
  final ApiStory _apiStory;

  StoryDetailProvider(this._apiStory);

  StoryDetailResultState _resultState = const StoryDetailResultState.none();
  StoryDetailResultState get resultState => _resultState;

  Future<void> fetchStoryDetail(String id) async {
    try {
      _resultState = StoryDetailResultState.loading();
      notifyListeners();

      final result = await _apiStory.getStoryDetail(id);

      if (result.error) {
        _resultState = StoryDetailResultState.error(result.message);
      } else {
        _resultState = StoryDetailResultState.loaded(result.story);
      }

      notifyListeners();
    } on Exception catch (_) {
      _resultState = StoryDetailResultState.error(
        'Tidak dapat terhubung ke internet. Periksa koneksi Anda dan coba lagi.',
      );
      notifyListeners();
    }
  }
}
