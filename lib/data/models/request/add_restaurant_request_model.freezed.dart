// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_restaurant_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddRestaurantRequestModel _$AddRestaurantRequestModelFromJson(
    Map<String, dynamic> json) {
  return _AddRestaurantRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AddRestaurantRequestModel {
  DataRestaurant get dataRestaurant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddRestaurantRequestModelCopyWith<AddRestaurantRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddRestaurantRequestModelCopyWith<$Res> {
  factory $AddRestaurantRequestModelCopyWith(AddRestaurantRequestModel value,
          $Res Function(AddRestaurantRequestModel) then) =
      _$AddRestaurantRequestModelCopyWithImpl<$Res, AddRestaurantRequestModel>;
  @useResult
  $Res call({DataRestaurant dataRestaurant});

  $DataRestaurantCopyWith<$Res> get dataRestaurant;
}

/// @nodoc
class _$AddRestaurantRequestModelCopyWithImpl<$Res,
        $Val extends AddRestaurantRequestModel>
    implements $AddRestaurantRequestModelCopyWith<$Res> {
  _$AddRestaurantRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataRestaurant = null,
  }) {
    return _then(_value.copyWith(
      dataRestaurant: null == dataRestaurant
          ? _value.dataRestaurant
          : dataRestaurant // ignore: cast_nullable_to_non_nullable
              as DataRestaurant,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataRestaurantCopyWith<$Res> get dataRestaurant {
    return $DataRestaurantCopyWith<$Res>(_value.dataRestaurant, (value) {
      return _then(_value.copyWith(dataRestaurant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddRestaurantRequestModelCopyWith<$Res>
    implements $AddRestaurantRequestModelCopyWith<$Res> {
  factory _$$_AddRestaurantRequestModelCopyWith(
          _$_AddRestaurantRequestModel value,
          $Res Function(_$_AddRestaurantRequestModel) then) =
      __$$_AddRestaurantRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataRestaurant dataRestaurant});

  @override
  $DataRestaurantCopyWith<$Res> get dataRestaurant;
}

/// @nodoc
class __$$_AddRestaurantRequestModelCopyWithImpl<$Res>
    extends _$AddRestaurantRequestModelCopyWithImpl<$Res,
        _$_AddRestaurantRequestModel>
    implements _$$_AddRestaurantRequestModelCopyWith<$Res> {
  __$$_AddRestaurantRequestModelCopyWithImpl(
      _$_AddRestaurantRequestModel _value,
      $Res Function(_$_AddRestaurantRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataRestaurant = null,
  }) {
    return _then(_$_AddRestaurantRequestModel(
      dataRestaurant: null == dataRestaurant
          ? _value.dataRestaurant
          : dataRestaurant // ignore: cast_nullable_to_non_nullable
              as DataRestaurant,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddRestaurantRequestModel implements _AddRestaurantRequestModel {
  const _$_AddRestaurantRequestModel({required this.dataRestaurant});

  factory _$_AddRestaurantRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddRestaurantRequestModelFromJson(json);

  @override
  final DataRestaurant dataRestaurant;

  @override
  String toString() {
    return 'AddRestaurantRequestModel(dataRestaurant: $dataRestaurant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddRestaurantRequestModel &&
            (identical(other.dataRestaurant, dataRestaurant) ||
                other.dataRestaurant == dataRestaurant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dataRestaurant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddRestaurantRequestModelCopyWith<_$_AddRestaurantRequestModel>
      get copyWith => __$$_AddRestaurantRequestModelCopyWithImpl<
          _$_AddRestaurantRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddRestaurantRequestModelToJson(
      this,
    );
  }
}

abstract class _AddRestaurantRequestModel implements AddRestaurantRequestModel {
  const factory _AddRestaurantRequestModel(
          {required final DataRestaurant dataRestaurant}) =
      _$_AddRestaurantRequestModel;

  factory _AddRestaurantRequestModel.fromJson(Map<String, dynamic> json) =
      _$_AddRestaurantRequestModel.fromJson;

  @override
  DataRestaurant get dataRestaurant;
  @override
  @JsonKey(ignore: true)
  _$$_AddRestaurantRequestModelCopyWith<_$_AddRestaurantRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

DataRestaurant _$DataRestaurantFromJson(Map<String, dynamic> json) {
  return _DataRestaurant.fromJson(json);
}

/// @nodoc
mixin _$DataRestaurant {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataRestaurantCopyWith<DataRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataRestaurantCopyWith<$Res> {
  factory $DataRestaurantCopyWith(
          DataRestaurant value, $Res Function(DataRestaurant) then) =
      _$DataRestaurantCopyWithImpl<$Res, DataRestaurant>;
  @useResult
  $Res call(
      {String name,
      String description,
      String latitude,
      String longitude,
      String photo,
      String address,
      int userId});
}

/// @nodoc
class _$DataRestaurantCopyWithImpl<$Res, $Val extends DataRestaurant>
    implements $DataRestaurantCopyWith<$Res> {
  _$DataRestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? photo = null,
    Object? address = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataRestaurantCopyWith<$Res>
    implements $DataRestaurantCopyWith<$Res> {
  factory _$$_DataRestaurantCopyWith(
          _$_DataRestaurant value, $Res Function(_$_DataRestaurant) then) =
      __$$_DataRestaurantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String latitude,
      String longitude,
      String photo,
      String address,
      int userId});
}

/// @nodoc
class __$$_DataRestaurantCopyWithImpl<$Res>
    extends _$DataRestaurantCopyWithImpl<$Res, _$_DataRestaurant>
    implements _$$_DataRestaurantCopyWith<$Res> {
  __$$_DataRestaurantCopyWithImpl(
      _$_DataRestaurant _value, $Res Function(_$_DataRestaurant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? photo = null,
    Object? address = null,
    Object? userId = null,
  }) {
    return _then(_$_DataRestaurant(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataRestaurant implements _DataRestaurant {
  const _$_DataRestaurant(
      {required this.name,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.photo,
      required this.address,
      required this.userId});

  factory _$_DataRestaurant.fromJson(Map<String, dynamic> json) =>
      _$$_DataRestaurantFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String photo;
  @override
  final String address;
  @override
  final int userId;

  @override
  String toString() {
    return 'DataRestaurant(name: $name, description: $description, latitude: $latitude, longitude: $longitude, photo: $photo, address: $address, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataRestaurant &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, latitude,
      longitude, photo, address, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataRestaurantCopyWith<_$_DataRestaurant> get copyWith =>
      __$$_DataRestaurantCopyWithImpl<_$_DataRestaurant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataRestaurantToJson(
      this,
    );
  }
}

abstract class _DataRestaurant implements DataRestaurant {
  const factory _DataRestaurant(
      {required final String name,
      required final String description,
      required final String latitude,
      required final String longitude,
      required final String photo,
      required final String address,
      required final int userId}) = _$_DataRestaurant;

  factory _DataRestaurant.fromJson(Map<String, dynamic> json) =
      _$_DataRestaurant.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get photo;
  @override
  String get address;
  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$_DataRestaurantCopyWith<_$_DataRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}
