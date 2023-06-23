import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/response/error_response_model.dart';
import '../../data/models/response/restaurants_response_model.dart';

part 'get_all_restaurant_event.dart';
part 'get_all_restaurant_state.dart';
part 'get_all_restaurant_bloc.freezed.dart';

class GetAllRestaurantBloc
    extends Bloc<GetAllRestaurantEvent, GetAllRestaurantState> {
  final RestaurantRemoteDataSource datasource;
  GetAllRestaurantBloc(this.datasource) : super(const _Initial()) {
    on<_GetAllRestaurant>(
      (event, emit) async {
        emit(const _Loading());
        final result = await datasource.getAllRestaurant();

        result.fold(
          (l) => emit(_Error(l)),
          (r) => emit(_Loaded(r)),
        );
      },
    );
  }
}
