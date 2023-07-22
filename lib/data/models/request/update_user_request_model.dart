import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_request_model.freezed.dart';
part 'update_user_request_model.g.dart';

@freezed
class UpdateUserRequestModel with _$UpdateUserRequestModel {
  const factory UpdateUserRequestModel({
    required String email,
    required String username,
  }) = _UpdateUserRequestModel;

  factory UpdateUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestModelFromJson(json);
}
