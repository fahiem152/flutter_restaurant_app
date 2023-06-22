// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantsResponseModel _$$_RestaurantsResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_RestaurantsResponseModel(
      dataRestaurant: (json['dataRestaurant'] as List<dynamic>)
          .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RestaurantsResponseModelToJson(
        _$_RestaurantsResponseModel instance) =>
    <String, dynamic>{
      'dataRestaurant': instance.dataRestaurant,
      'meta': instance.meta,
    };

_$_Restaurant _$$_RestaurantFromJson(Map<String, dynamic> json) =>
    _$_Restaurant(
      id: json['id'] as int,
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$_Attributes _$$_AttributesFromJson(Map<String, dynamic> json) =>
    _$_Attributes(
      name: json['name'] as String,
      description: json['description'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      address: json['address'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      photo: json['photo'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_AttributesToJson(_$_Attributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'publishedAt': instance.publishedAt.toIso8601String(),
      'photo': instance.photo,
      'userId': instance.userId,
    };

_$_Meta _$$_MetaFromJson(Map<String, dynamic> json) => _$_Meta(
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MetaToJson(_$_Meta instance) => <String, dynamic>{
      'pagination': instance.pagination,
    };

_$_Pagination _$$_PaginationFromJson(Map<String, dynamic> json) =>
    _$_Pagination(
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      pageCount: json['pageCount'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$$_PaginationToJson(_$_Pagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'pageCount': instance.pageCount,
      'total': instance.total,
    };
