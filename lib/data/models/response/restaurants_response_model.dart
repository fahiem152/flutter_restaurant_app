import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurants_response_model.freezed.dart';
part 'restaurants_response_model.g.dart';

@freezed
class RestaurantsResponseModel with _$RestaurantsResponseModel {
  const factory RestaurantsResponseModel({
    required List<Restaurant> dataRestaurant,
    required Meta meta,
  }) = _RestaurantsResponseModel;

  factory RestaurantsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsResponseModelFromJson(json);
}

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required int id,
    required Attributes attributes,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
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
    required String photo,
    required String userId,
  }) = _Attributes;

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    required Pagination pagination,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int page,
    required int pageSize,
    required int pageCount,
    required int total,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
