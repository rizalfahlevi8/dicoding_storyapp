import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/data/model/story_detail_response.dart';
import 'package:story_app/data/model/story_list_response.dart';

class ApiStory {
  static const String _baseUrl = "https://story-api.dicoding.dev/v1";

  Future<StoryListResponse> getStoryList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    
    final response = await http.get(
      Uri.parse("$_baseUrl/stories"),
      headers: {
          'Authorization': 'Bearer $token',
        },
    );

    print(response.body);
    if (response.statusCode == 200) {
      return StoryListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load story list");
    }
  }

  Future<StoryDetailResponse> getStoryDetail(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    
    final response = await http.get(
      Uri.parse("$_baseUrl/stories/$id"),
      headers: {
          'Authorization': 'Bearer $token',
        },
    );

    print(response.body);
    if (response.statusCode == 200) {
      return StoryDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load story list");
    }
  }
}
