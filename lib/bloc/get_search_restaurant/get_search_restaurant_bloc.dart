// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant/data/models/response/error_response_model.dart';
import 'package:flutter_restaurant/data/models/response/restaurants_response_model.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';

part 'get_search_restaurant_bloc.freezed.dart';
part 'get_search_restaurant_event.dart';
part 'get_search_restaurant_state.dart';

class GetSearchRestaurantBloc
    extends Bloc<GetSearchRestaurantEvent, GetSearchRestaurantState> {
  final RestaurantRemoteDataSource restaurantRemoteDataSource;

  GetSearchRestaurantBloc(
    this.restaurantRemoteDataSource,
  ) : super(const _Initial()) {
    on<_SaerchRestaurant>((event, emit) async {
      emit(const _Loading());
      final result = await restaurantRemoteDataSource.getRestaurantBySaerch(
        event.keyRestaurant,
      );

      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
