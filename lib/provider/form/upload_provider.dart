import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as img;
import 'package:story_app/data/api/api_story.dart';
import 'package:story_app/data/model/upload_response.dart';

class UploadProvider extends ChangeNotifier {
  final ApiStory apiStory;
  UploadProvider(this.apiStory);

  bool isUploading = false;
  String message = "";
  UploadResponse? uploadResponse;

  Future<void> upload(
    List<int> bytes,
    String fileName,
    String description,
  ) async {
    try {
      message = "";
      uploadResponse = null;
      isUploading = true;
      notifyListeners();
      uploadResponse = await apiStory.uploadDocument(
        bytes,
        fileName,
        description,
      );
      message = uploadResponse?.message ?? "success";
      isUploading = false;
      notifyListeners();
    } catch (e) {
      isUploading = false;
      message = e.toString();
      notifyListeners();
    }
  }

  Future<List<int>> compressImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;
    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
    int compressQuality = 100;
    int length = imageLength;
    List<int> newByte = [];
    do {
      compressQuality -= 10;
      newByte = img.encodeJpg(image, quality: compressQuality);
      length = newByte.length;
    } while (length > 1000000);
    return newByte;
  }
}
