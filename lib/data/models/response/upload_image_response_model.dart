import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_response_model.freezed.dart';
part 'upload_image_response_model.g.dart';

@freezed
class UploadImageResponseModel with _$UploadImageResponseModel {
  const factory UploadImageResponseModel({
    required int id,
    required String name,
    // required String? alternativeText,
    // required dynamic? caption,
    required int width,
    required int height,
    // required dynamic? formats,
    required String hash,
    required String ext,
    required String mime,
    required double size,
    required String url,
    // required dynamic? previewUrl,
    required String provider,
    // required dynamic? provider_metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UploadImageResponseModel;

  factory UploadImageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseModelFromJson(json);
}
