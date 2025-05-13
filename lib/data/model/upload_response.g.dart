// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadResponse _$UploadResponseFromJson(Map<String, dynamic> json) =>
    _UploadResponse(
      error: json['error'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UploadResponseToJson(_UploadResponse instance) =>
    <String, dynamic>{'error': instance.error, 'message': instance.message};
