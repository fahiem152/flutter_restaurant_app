import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_restaurant/bloc/get_restaurant_by_uesr_id/get_restaurant_by_user_id_bloc.dart';
import 'package:flutter_restaurant/data/models/response/error_response_model.dart';
import 'package:flutter_restaurant/data/models/response/restaurants_response_model.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'get_restaurant_by_user_id_bloc_test.mocks.dart';

@GenerateMocks([RestaurantRemoteDataSource])
void main() {
  late GetRestaurantByUserIdBloc getRestaurantByUserIdBloc;
  late MockRestaurantRemoteDataSource mockRestaurantRemoteDataSource;
  setUp(() {
    mockRestaurantRemoteDataSource = MockRestaurantRemoteDataSource();
    getRestaurantByUserIdBloc =
        GetRestaurantByUserIdBloc(mockRestaurantRemoteDataSource);
  });

  const String jsonString = '''
  {
    "data": [
        {
            "id": 110,
            "attributes": {
                "name": "smart resto",
                "description": "tempat bagus sekali",
                "latitude": "-6.905945202603648",
                "longitude": "110.650256210873",
                "address": "jalan sunan kalijaga",
                "createdAt": "2023-07-05T01:56:57.716Z",
                "updatedAt": "2023-07-05T01:56:57.716Z",
                "publishedAt": "2023-07-05T01:56:57.711Z",
                "photo": "http://103.150.116.14:1337/uploads/scaled_IMG_20230705_WA_0000_bc190b1cef.jpg",
                "userId": "9"
            }
        },
        {
            "id": 112,
            "attributes": {
                "name": "Smart Resto location",
                "description": "tempat bagus sekali. sangat murah",
                "latitude": "-7.0243782",
                "longitude": "110.5096049",
                "address": "Jl. Raya Bandungrejo No.148, Bandungrejo, Kecamatan Mranggen, 59567",
                "createdAt": "2023-07-05T13:15:14.669Z",
                "updatedAt": "2023-07-05T13:15:14.669Z",
                "publishedAt": "2023-07-05T13:15:14.663Z",
                "photo": "http://103.150.116.14:1337/uploads/scaled_IMG_20230705_WA_0000_2da92a4dbf.jpg",
                "userId": "9"
            }
        }
          ],
    "meta": {
        "pagination": {
            "page": 1,
            "pageSize": 25,
            "pageCount": 1,
            "total": 20
        }
    }
}''';

  const String jsonStringError = '''{
    "data": [],
    "meta": {
        "pagination": {
            "page": 1,
            "pageSize": 25,
            "pageCount": 0,
            "total": 0
        }
    }
}''';

  const int userId = 9;
  final modelResponseSuccess = RestaurantsResponseModel.fromJson(
    jsonDecode(jsonString),
  );
  // final modelResponseFailded =
  //     ErrorResponseModel.fromJson(jsonDecode(jsonStringError));

  blocTest<GetRestaurantByUserIdBloc, GetRestaurantByUserIdState>(
      'GetRestaurantByUserIdBloc emits [_Loading, _Loaded] when event getRestaurantByUserId success.',
      build: () {
        when(mockRestaurantRemoteDataSource.getRestaurantByUserId(userId))
            .thenAnswer((realInvocation) async {
          return Right(modelResponseSuccess);
        });
        return getRestaurantByUserIdBloc;
      },
      act: (bloc) => bloc.add(
            const GetRestaurantByUserIdEvent.getRestaurantByUserId(),
          ),
      expect: () => <GetRestaurantByUserIdState>[
            const GetRestaurantByUserIdState.loading(),
            GetRestaurantByUserIdState.loaded(modelResponseSuccess),
          ]);
}
