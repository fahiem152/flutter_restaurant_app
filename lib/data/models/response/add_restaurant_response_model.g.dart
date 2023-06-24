// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_restaurant_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddRestaurantResponseModel _$$_AddRestaurantResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_AddRestaurantResponseModel(
      data: DataRestaurant.fromJson(json['data'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AddRestaurantResponseModelToJson(
        _$_AddRestaurantResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$_DataRestaurant _$$_DataRestaurantFromJson(Map<String, dynamic> json) =>
    _$_DataRestaurant(
      id: json['id'] as int,
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataRestaurantToJson(_$_DataRestaurant instance) =>
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

_$_Meta _$$_MetaFromJson(Map<String, dynamic> json) => _$_Meta();

Map<String, dynamic> _$$_MetaToJson(_$_Meta instance) => <String, dynamic>{};
