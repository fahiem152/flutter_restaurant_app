// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_user_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateUserRequestModel _$UpdateUserRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UpdateUserRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateUserRequestModelCopyWith<UpdateUserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserRequestModelCopyWith<$Res> {
  factory $UpdateUserRequestModelCopyWith(UpdateUserRequestModel value,
          $Res Function(UpdateUserRequestModel) then) =
      _$UpdateUserRequestModelCopyWithImpl<$Res, UpdateUserRequestModel>;
  @useResult
  $Res call({String email, String username});
}

/// @nodoc
class _$UpdateUserRequestModelCopyWithImpl<$Res,
        $Val extends UpdateUserRequestModel>
    implements $UpdateUserRequestModelCopyWith<$Res> {
  _$UpdateUserRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateUserRequestModelCopyWith<$Res>
    implements $UpdateUserRequestModelCopyWith<$Res> {
  factory _$$_UpdateUserRequestModelCopyWith(_$_UpdateUserRequestModel value,
          $Res Function(_$_UpdateUserRequestModel) then) =
      __$$_UpdateUserRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String username});
}

/// @nodoc
class __$$_UpdateUserRequestModelCopyWithImpl<$Res>
    extends _$UpdateUserRequestModelCopyWithImpl<$Res,
        _$_UpdateUserRequestModel>
    implements _$$_UpdateUserRequestModelCopyWith<$Res> {
  __$$_UpdateUserRequestModelCopyWithImpl(_$_UpdateUserRequestModel _value,
      $Res Function(_$_UpdateUserRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
  }) {
    return _then(_$_UpdateUserRequestModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateUserRequestModel implements _UpdateUserRequestModel {
  const _$_UpdateUserRequestModel(
      {required this.email, required this.username});

  factory _$_UpdateUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateUserRequestModelFromJson(json);

  @override
  final String email;
  @override
  final String username;

  @override
  String toString() {
    return 'UpdateUserRequestModel(email: $email, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserRequestModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateUserRequestModelCopyWith<_$_UpdateUserRequestModel> get copyWith =>
      __$$_UpdateUserRequestModelCopyWithImpl<_$_UpdateUserRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateUserRequestModelToJson(
      this,
    );
  }
}

abstract class _UpdateUserRequestModel implements UpdateUserRequestModel {
  const factory _UpdateUserRequestModel(
      {required final String email,
      required final String username}) = _$_UpdateUserRequestModel;

  factory _UpdateUserRequestModel.fromJson(Map<String, dynamic> json) =
      _$_UpdateUserRequestModel.fromJson;

  @override
  String get email;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateUserRequestModelCopyWith<_$_UpdateUserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
