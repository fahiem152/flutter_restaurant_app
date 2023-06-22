// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_restaurant_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddRestaurantRequestModel _$$_AddRestaurantRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_AddRestaurantRequestModel(
      dataRestaurant: DataRestaurant.fromJson(
          json['dataRestaurant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AddRestaurantRequestModelToJson(
        _$_AddRestaurantRequestModel instance) =>
    <String, dynamic>{
      'dataRestaurant': instance.dataRestaurant,
    };

_$_DataRestaurant _$$_DataRestaurantFromJson(Map<String, dynamic> json) =>
    _$_DataRestaurant(
      name: json['name'] as String,
      description: json['description'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      photo: json['photo'] as String,
      address: json['address'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$$_DataRestaurantToJson(_$_DataRestaurant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'photo': instance.photo,
      'address': instance.address,
      'userId': instance.userId,
    };
