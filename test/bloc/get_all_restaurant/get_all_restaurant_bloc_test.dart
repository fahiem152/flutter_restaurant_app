import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_restaurant/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:flutter_restaurant/data/models/response/error_response_model.dart';
import 'package:flutter_restaurant/data/models/response/restaurants_response_model.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_restaurant_bloc_test.mocks.dart';

@GenerateMocks([RestaurantRemoteDataSource])
void main() {
  late GetAllRestaurantBloc getAllRestaurantBloc;
  late MockRestaurantRemoteDataSource mockRestaurantRemoteDataSource;
  setUp(() {
    mockRestaurantRemoteDataSource = MockRestaurantRemoteDataSource();
    getAllRestaurantBloc = GetAllRestaurantBloc(mockRestaurantRemoteDataSource);
  });

  const String jsonStringLoaded = '''{
    "data": [
        {
            "id": 6,
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
        {
            "id": 26,
            "attributes": {
                "name": "Alang Puyuh",
                "description": "Cafe & Resto",
                "latitude": "-3.016910909077944",
                "longitude": "120.15385069886861",
                "address": "Jl. Andi Kambo",
                "createdAt": "2023-06-22T02:31:08.204Z",
                "updatedAt": "2023-06-25T08:58:03.274Z",
                "publishedAt": "2023-06-15T08:35:25.622Z",
                "photo": "https://images.unsplash.com/photo-1533090699061-11bd9fc5a96b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=686&q=80",
                "userId": "1"
            }
        },
        {
            "id": 33,
            "attributes": {
                "name": "Ruminate 2",
                "description": "Coffe shop and eatery",
                "latitude": "10",
                "longitude": "10",
                "address": "jalan angkasa",
                "createdAt": "2023-06-26T09:14:28.604Z",
                "updatedAt": "2023-06-26T09:14:28.604Z",
                "publishedAt": "2023-06-26T09:14:28.600Z",
                "photo": "https://media-cdn.tripadvisor.com/media/photo-s/0d/db/3f/bd/getlstd-property-photo.jpg",
                "userId": "1"
            }
        }
        ],
            "meta": {
        "pagination": {
            "page": 1,
            "pageSize": 25,
            "pageCount": 2,
            "total": 41
        }
    }
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

  final modelResponseSuccess =
      RestaurantsResponseModel.fromJson(jsonDecode(jsonStringLoaded));
  final modelResponseFailded =
      ErrorResponseModel.fromJson(jsonDecode(jsonStringError));

  blocTest(
    'GetAllRestaurant emits [_Loading, _Loaded] when event getAllRestaurant success',
    build: () {
      when(mockRestaurantRemoteDataSource.getAllRestaurant())
          .thenAnswer((realInvocation) async {
        return Right(modelResponseSuccess);
      });
      return getAllRestaurantBloc;
    },
    act: (bloc) => bloc.add(const GetAllRestaurantEvent.getAllRestaurant()),
    expect: () => <GetAllRestaurantState>[
      const GetAllRestaurantState.loading(),
      GetAllRestaurantState.loaded(modelResponseSuccess),
    ],
  );

  blocTest(
    'GetAllRestaurant emits [_Loading, _Error] when event getAllRestaurant Failed ',
    build: () {
      when(mockRestaurantRemoteDataSource.getAllRestaurant())
          .thenAnswer((realInvocation) async {
        return Left(modelResponseFailded);
      });
      return getAllRestaurantBloc;
    },
    act: (bloc) => bloc.add(const GetAllRestaurantEvent.getAllRestaurant()),
    expect: () => <GetAllRestaurantState>[
      const GetAllRestaurantState.loading(),
      GetAllRestaurantState.error(
        modelResponseFailded,
      ),
    ],
  );
}
