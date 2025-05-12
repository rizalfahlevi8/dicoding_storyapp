import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/data/model/story_detail_response.dart';
import 'package:story_app/data/model/story_list_response.dart';
import 'package:story_app/data/model/upload_response.dart';

class ApiStory {
  final http.Client client;

  ApiStory(this.client);

  static const String _baseUrl = "https://story-api.dicoding.dev/v1";

  Future<StoryListResponse> getStoryList([int page = 1, int size = 10]) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await http.get(
      Uri.parse("$_baseUrl/stories?page=$page&size=$size"),
      headers: {'Authorization': 'Bearer $token'},
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
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return StoryDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load story list");
    }
  }

  Future<UploadResponse> uploadDocument(
    List<int> bytes,
    String fileName,
    String description,
    double latitude,
    double longitude,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    var request = http.MultipartRequest('POST', Uri.parse("$_baseUrl/stories"));

    final multiPartFile = http.MultipartFile.fromBytes(
      "photo",
      bytes,
      filename: fileName,
    );
    final Map<String, String> fields = {
      "description": description,
      "lat": latitude.toString(),
      "lon": longitude.toString(),
    };
    final Map<String, String> headers = {
      "Content-type": "multipart/form-data",
      'Authorization': 'Bearer $token',
    };

    request.files.add(multiPartFile);
    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final http.StreamedResponse streamedResponse = await request.send();
    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (streamedResponse.statusCode == 201) {
      final UploadResponse uploadResponse = UploadResponse.fromJson(
        jsonDecode(responseData),
      );
      return uploadResponse;
    } else {
      throw Exception("Upload file error");
    }
  }
}
