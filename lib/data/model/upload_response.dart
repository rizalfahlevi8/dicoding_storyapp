class UploadResponse {
  final bool error;
  final String message;

  UploadResponse({
    required this.error,
    required this.message,
  });

  factory UploadResponse.fromJson(Map<String, dynamic> json) {
    return UploadResponse(
      error: json['error'],
      message: json['message'],
    );
  }
}