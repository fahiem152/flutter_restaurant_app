// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorResponseModel _$$_ErrorResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_ErrorResponseModel(
      data: json['data'],
      error: Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ErrorResponseModelToJson(
        _$_ErrorResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };

_$_Error _$$_ErrorFromJson(Map<String, dynamic> json) => _$_Error(
      status: json['status'] as int,
      name: json['name'] as String,
      message: json['message'] as String,
      details: Details.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ErrorToJson(_$_Error instance) => <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'message': instance.message,
      'details': instance.details,
    };

_$_Details _$$_DetailsFromJson(Map<String, dynamic> json) => _$_Details();

Map<String, dynamic> _$$_DetailsToJson(_$_Details instance) =>
    <String, dynamic>{};
