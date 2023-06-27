import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_restaurant_request_model.freezed.dart';
part 'add_restaurant_request_model.g.dart';

@freezed
class AddRestaurantRequestModel with _$AddRestaurantRequestModel {
  const factory AddRestaurantRequestModel({
    required DataRestaurant data,
  }) = _AddRestaurantRequestModel;

  factory AddRestaurantRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddRestaurantRequestModelFromJson(json);
}

@freezed
class DataRestaurant with _$DataRestaurant {
  const factory DataRestaurant({
    required String name,
    required String description,
    required String latitude,
    required String longitude,
    @Default(
      "https://img.freepik.com/free-photo/modern-interior-design-office_181624-21578.jpg",
    )
    String photo,
    required String address,
    required int userId,
  }) = _DataRestaurant;

  factory DataRestaurant.fromJson(Map<String, dynamic> json) =>
      _$DataRestaurantFromJson(json);
}
