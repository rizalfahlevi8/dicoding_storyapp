import 'package:flutter/material.dart';
import 'package:story_app/data/api/api_story.dart';
import 'package:story_app/static/story_list_result_state.dart';

class StoryListProvider extends ChangeNotifier {
  final ApiStory _apiStory;

  StoryListProvider(this._apiStory);

  StoryListResultState _resultState = StoryListNoneState();
  StoryListResultState get resultState => _resultState;

    Future<void> fetchStoryList() async {
    try {
      _resultState = StoryListLoadingState();
      notifyListeners();

      final result = await _apiStory.getStoryList();

      if (result.error) {
        _resultState = StoryListErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = StoryListResultLoadedState(result.listStory);
        notifyListeners();
      }
    } on Exception catch (_) {
      _resultState = StoryListErrorState(
          'Tidak dapat terhubung ke internet. Periksa koneksi Anda dan coba lagi.');
      notifyListeners();
    }
  }
}
