// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/data/local_datasource/auth_local_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant/data/models/response/error_response_model.dart';
import 'package:flutter_restaurant/data/models/response/restaurants_response_model.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';

part 'get_restaurant_by_user_id_bloc.freezed.dart';
part 'get_restaurant_by_user_id_event.dart';
part 'get_restaurant_by_user_id_state.dart';

class GetRestaurantByUserIdBloc
    extends Bloc<GetRestaurantByUserIdEvent, GetRestaurantByUserIdState> {
  final RestaurantRemoteDataSource datasource;

  GetRestaurantByUserIdBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_GetRestaurantByUserId>((event, emit) async {
      emit(const _Loading());
      final userId = await AuthLocalDataSource().getUserId();
      final result = await datasource.getRestaurantByUserId(userId!);

      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
