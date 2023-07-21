import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_restaurant/bloc/get_search_restaurant/get_search_restaurant_bloc.dart';
import 'package:flutter_restaurant/data/models/response/restaurants_response_model.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_search_restaurant_bloc_test.mocks.dart';

@GenerateMocks([RestaurantRemoteDataSource])
void main() {
  late GetSearchRestaurantBloc getSearchRestaurantBloc;
  late MockRestaurantRemoteDataSource mockRestaurantRemoteDataSource;
  setUp(() {
    mockRestaurantRemoteDataSource = MockRestaurantRemoteDataSource();
    getSearchRestaurantBloc =
        GetSearchRestaurantBloc(mockRestaurantRemoteDataSource);
  });

  const String jsonStringLoaded = '''
{
    "data": [
        {
            "id": 45,
            "attributes": {
                "name": "SmartResto 6",
                "description": "tes",
                "latitude": "-6.905955853599874",
                "longitude": "110.65030985505514",
                "address": "Jalan Suka Maju",
                "createdAt": "2023-06-26T15:20:45.553Z",
                "updatedAt": "2023-06-26T15:20:45.553Z",
                "publishedAt": "2023-06-26T15:20:45.547Z",
                "photo": "http://103.150.116.14:1337/uploads/scaled_IMG_20230625_WA_0017_2055fb9024.jpg",
                "userId": "1"
            }
        },
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
        }
        
    ],
    "meta": {
        "pagination": {
            "page": 1,
            "pageSize": 25,
            "pageCount": 1,
            "total": 19
        }
    }
}
''';

  final modelResponseSuccess =
      RestaurantsResponseModel.fromJson(jsonDecode(jsonStringLoaded));

  const String search = 'resto';

  blocTest(
    'GetSearchRestaurantBloc emits [_Loading, _Loaded] when event searchRestaurant',
    build: () {
      when(mockRestaurantRemoteDataSource.getRestaurantBySaerch(search))
          .thenAnswer((realInvocation) async {
        return Right(modelResponseSuccess);
      });
      return getSearchRestaurantBloc;
    },
    act: (bloc) =>
        bloc.add(const GetSearchRestaurantEvent.saerchRestaurant(search)),
    expect: () => <GetSearchRestaurantState>[
      GetSearchRestaurantState.loading(),
      GetSearchRestaurantState.loaded(modelResponseSuccess)
    ],
  );
}
