import 'package:flutter/material.dart';
import 'package:story_app/data/api/api_story.dart';
import 'package:story_app/data/model/story.dart';
import 'package:story_app/static/story_list_result_state.dart';

class StoryListProvider extends ChangeNotifier {
  final ApiStory _apiStory;

  StoryListProvider(this._apiStory);

  int? pageItems = 1;
  int sizeItems = 10;

  List<Story> _allStories = [];
  List<Story> get allStories => _allStories;

  StoryListResultState _resultState = StoryListNoneState();
  StoryListResultState get resultState => _resultState;

  Future<void> fetchStoryList({bool reset = false}) async {
    try {
      if (reset) {
        pageItems = 1;
        _allStories = [];
      }

      if (pageItems == 1) {
        _resultState = StoryListLoadingState();
        notifyListeners();
      }

      final result = await _apiStory.getStoryList(pageItems!, sizeItems);

      if (result.error) {
        _resultState = StoryListErrorState(result.message);
        notifyListeners();
      } else {
        _allStories.addAll(result.listStory);
        _resultState = StoryListResultLoadedState(_allStories);

        if (result.listStory.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
        notifyListeners();
      }
    } on Exception catch (_) {
      _resultState = StoryListErrorState(
        'Tidak dapat terhubung ke internet. Periksa koneksi Anda dan coba lagi.',
      );
      notifyListeners();
    }
  }
}
