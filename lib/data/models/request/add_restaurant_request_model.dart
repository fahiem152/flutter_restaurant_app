import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_restaurant_request_model.freezed.dart';
part 'add_restaurant_request_model.g.dart';

@freezed
class AddRestaurantRequestModel with _$AddRestaurantRequestModel {
  const factory AddRestaurantRequestModel({
    required DataRestaurant dataRestaurant,
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
    required String photo,
    required String address,
    required int userId,
  }) = _DataRestaurant;

  factory DataRestaurant.fromJson(Map<String, dynamic> json) =>
      _$DataRestaurantFromJson(json);
}
