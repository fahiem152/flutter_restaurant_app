
import 'package:freezed_annotation/freezed_annotation.dart';


part 'error_response_model.freezed.dart';
part 'error_response_model.g.dart';

@freezed
class ErrorResponseModel with _$ErrorResponseModel {
  const factory ErrorResponseModel({
    required dynamic data,
    required Error error,
  }) = _ErrorResponseModel;

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);
}

@freezed
class Error with _$Error {
  const factory Error({
    required int status,
    required String name,
    required String message,
    required Details details,
  }) = _Error;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}

@freezed
class Details with _$Details {
  const factory Details() = _Details;

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
}
