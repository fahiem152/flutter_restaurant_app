// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_restaurant/test/bloc/get_restaurant_by_uesr_id/get_restaurant_by_user_id_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter_restaurant/data/models/request/add_restaurant_request_model.dart'
    as _i10;
import 'package:flutter_restaurant/data/models/response/add_restaurant_response_model.dart'
    as _i7;
import 'package:flutter_restaurant/data/models/response/error_response_model.dart'
    as _i5;
import 'package:flutter_restaurant/data/models/response/restaurants_response_model.dart'
    as _i6;
import 'package:flutter_restaurant/data/models/response/upload_image_response_model.dart'
    as _i8;
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart'
    as _i3;
import 'package:image_picker/image_picker.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RestaurantRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRestaurantRemoteDataSource extends _i1.Mock
    implements _i3.RestaurantRemoteDataSource {
  MockRestaurantRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<
      _i2.Either<_i5.ErrorResponseModel,
          _i6.RestaurantsResponseModel>> getAllRestaurant() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllRestaurant,
          [],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.ErrorResponseModel,
                    _i6.RestaurantsResponseModel>>.value(
            _FakeEither_0<_i5.ErrorResponseModel, _i6.RestaurantsResponseModel>(
          this,
          Invocation.method(
            #getAllRestaurant,
            [],
          ),
        )),
      ) as _i4.Future<
          _i2.Either<_i5.ErrorResponseModel, _i6.RestaurantsResponseModel>>);
  @override
  _i4.Future<
      _i2.Either<_i5.ErrorResponseModel,
          _i6.RestaurantsResponseModel>> getRestaurantByUserId(int? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRestaurantByUserId,
          [userId],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.ErrorResponseModel,
                    _i6.RestaurantsResponseModel>>.value(
            _FakeEither_0<_i5.ErrorResponseModel, _i6.RestaurantsResponseModel>(
          this,
          Invocation.method(
            #getRestaurantByUserId,
            [userId],
          ),
        )),
      ) as _i4.Future<
          _i2.Either<_i5.ErrorResponseModel, _i6.RestaurantsResponseModel>>);
  @override
  _i4.Future<_i2.Either<_i5.ErrorResponseModel, _i6.RestaurantsResponseModel>>
      getRestaurantBySaerch(String? keyRestaurant) => (super.noSuchMethod(
            Invocation.method(
              #getRestaurantBySaerch,
              [keyRestaurant],
            ),
            returnValue: _i4.Future<
                _i2.Either<_i5.ErrorResponseModel,
                    _i6.RestaurantsResponseModel>>.value(_FakeEither_0<
                _i5.ErrorResponseModel, _i6.RestaurantsResponseModel>(
              this,
              Invocation.method(
                #getRestaurantBySaerch,
                [keyRestaurant],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.ErrorResponseModel,
                  _i6.RestaurantsResponseModel>>);
  @override
  _i4.Future<_i2.Either<_i5.ErrorResponseModel, _i7.AddRestaurantResponseModel>>
      getByIdRestaurant(int? idRestaurant) => (super.noSuchMethod(
            Invocation.method(
              #getByIdRestaurant,
              [idRestaurant],
            ),
            returnValue: _i4.Future<
                _i2.Either<_i5.ErrorResponseModel,
                    _i7.AddRestaurantResponseModel>>.value(_FakeEither_0<
                _i5.ErrorResponseModel, _i7.AddRestaurantResponseModel>(
              this,
              Invocation.method(
                #getByIdRestaurant,
                [idRestaurant],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.ErrorResponseModel,
                  _i7.AddRestaurantResponseModel>>);
  @override
  _i4.Future<
      _i2.Either<_i5.ErrorResponseModel,
          _i8.UploadImageResponseModel>> uploadImage(_i9.XFile? image) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadImage,
          [image],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.ErrorResponseModel,
                    _i8.UploadImageResponseModel>>.value(
            _FakeEither_0<_i5.ErrorResponseModel, _i8.UploadImageResponseModel>(
          this,
          Invocation.method(
            #uploadImage,
            [image],
          ),
        )),
      ) as _i4.Future<
          _i2.Either<_i5.ErrorResponseModel, _i8.UploadImageResponseModel>>);
  @override
  _i4.Future<_i2.Either<_i5.ErrorResponseModel, _i7.AddRestaurantResponseModel>>
      createRestaurant(_i10.AddRestaurantRequestModel? model) =>
          (super.noSuchMethod(
            Invocation.method(
              #createRestaurant,
              [model],
            ),
            returnValue: _i4.Future<
                _i2.Either<_i5.ErrorResponseModel,
                    _i7.AddRestaurantResponseModel>>.value(_FakeEither_0<
                _i5.ErrorResponseModel, _i7.AddRestaurantResponseModel>(
              this,
              Invocation.method(
                #createRestaurant,
                [model],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.ErrorResponseModel,
                  _i7.AddRestaurantResponseModel>>);
  @override
  _i4.Future<_i2.Either<_i5.ErrorResponseModel, _i6.Restaurant>>
      deleteRestaurant(int? idRestaurant) => (super.noSuchMethod(
            Invocation.method(
              #deleteRestaurant,
              [idRestaurant],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.ErrorResponseModel, _i6.Restaurant>>.value(
                _FakeEither_0<_i5.ErrorResponseModel, _i6.Restaurant>(
              this,
              Invocation.method(
                #deleteRestaurant,
                [idRestaurant],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.ErrorResponseModel, _i6.Restaurant>>);
  @override
  _i4.Future<_i2.Either<_i5.ErrorResponseModel, _i7.AddRestaurantResponseModel>>
      updateRestaurant(
    _i10.AddRestaurantRequestModel? model,
    int? idRestaurant,
  ) =>
          (super.noSuchMethod(
            Invocation.method(
              #updateRestaurant,
              [
                model,
                idRestaurant,
              ],
            ),
            returnValue: _i4.Future<
                _i2.Either<_i5.ErrorResponseModel,
                    _i7.AddRestaurantResponseModel>>.value(_FakeEither_0<
                _i5.ErrorResponseModel, _i7.AddRestaurantResponseModel>(
              this,
              Invocation.method(
                #updateRestaurant,
                [
                  model,
                  idRestaurant,
                ],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.ErrorResponseModel,
                  _i7.AddRestaurantResponseModel>>);
}
