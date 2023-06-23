import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_restaurant_response_model.freezed.dart';
part 'add_restaurant_response_model.g.dart';

@freezed
class AddRestaurantResponseModel with _$AddRestaurantResponseModel {
  const factory AddRestaurantResponseModel({
    required DataRestaurant data,
    required Meta meta,
  }) = _AddRestaurantResponseModel;

  factory AddRestaurantResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddRestaurantResponseModelFromJson(json);
}

@freezed
class DataRestaurant with _$DataRestaurant {
  const factory DataRestaurant({
    required int id,
    required Attributes attributes,
  }) = _DataRestaurant;

  factory DataRestaurant.fromJson(Map<String, dynamic> json) =>
      _$DataRestaurantFromJson(json);
}

@freezed
class Attributes with _$Attributes {
  const factory Attributes({
    required String name,
    required String description,
    required String latitude,
    required String longitude,
    required String address,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime publishedAt,
  }) = _Attributes;

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta() = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
