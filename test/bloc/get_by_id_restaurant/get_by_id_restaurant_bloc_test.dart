import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_restaurant/bloc/get_by_id_restaurant/get_by_id_restaurant_bloc.dart';
import 'package:flutter_restaurant/data/models/response/add_restaurant_response_model.dart';
import 'package:flutter_restaurant/data/models/response/error_response_model.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'get_by_id_restaurant_bloc_test.mocks.dart';

@GenerateMocks([RestaurantRemoteDataSource])
void main() {
  late GetByIdRestaurantBloc getRestaurantByUserIdBloc;
  late MockRestaurantRemoteDataSource mockRestaurantRemoteDataSource;

  setUp(() {
    mockRestaurantRemoteDataSource = MockRestaurantRemoteDataSource();
    getRestaurantByUserIdBloc =
        GetByIdRestaurantBloc(mockRestaurantRemoteDataSource);
  });

  const String jsonStringLoaded = '''{
    "data": {
        "id": 1,
        "attributes": {
            "name": "Gemati Coffe",
            "description": "Coffe & Eatery",
            "latitude": "-7.550337836789965",
            "longitude": "110.77169609703935",
            "address": "Jl. Matoa Raya I",
            "createdAt": "2023-06-15T09:42:23.355Z",
            "updatedAt": "2023-06-29T13:22:49.183Z",
            "publishedAt": "2023-06-15T08:35:25.622Z",
            "photo": "https://img.freepik.com/premium-photo/grodno-belarus-march-2019-inside-interior-modern-pub-sport-bar-with-dark-loft-design-style-with-red-chairs_97694-3440.jpg",
            "userId": "27"
        }
    },
    "meta": {}
}''';
  const String jsonStringError = '''{
    "data": null,
    "error": {
        "status": 404,
        "name": "NotFoundError",
        "message": "Not Found",
        "details": {}
    }
}''';

  const int idProduct = 1;

  final modelProduct =
      AddRestaurantResponseModel.fromJson(jsonDecode(jsonStringLoaded));

  final modelError = ErrorResponseModel.fromJson(jsonDecode(jsonStringError));

  blocTest(
    'GetRestaurantByUserIdBloc emits [_Loading, _Loaded] when event getRestaurantByUserId success.',
    build: () {
      when(mockRestaurantRemoteDataSource.getByIdRestaurant(idProduct))
          .thenAnswer((realInvocation) async {
        return Right(modelProduct);
      });
      return getRestaurantByUserIdBloc;
    },
    act: (bloc) => bloc.add(const GetByIdRestaurantEvent.getByIdRestaurant(1)),
    expect: () => <GetByIdRestaurantState>[
      const GetByIdRestaurantState.loading(),
      GetByIdRestaurantState.loaded(modelProduct),
    ],
  );

  blocTest(
    'GetRestaurantByUserIdBloc emits [_Loading, _Error] when event getRestaurantByUserId failed',
    build: () {
      when(mockRestaurantRemoteDataSource.getByIdRestaurant(idProduct))
          .thenAnswer((realInvocation) async {
        return Left(modelError);
      });
      return getRestaurantByUserIdBloc;
    },
    act: (bloc) => bloc.add(
      const GetByIdRestaurantEvent.getByIdRestaurant(
        1,
      ),
    ),
    expect: () => <GetByIdRestaurantState>[
      const GetByIdRestaurantState.loading(),
      GetByIdRestaurantState.error(
        modelError,
      ),
    ],
  );
}
