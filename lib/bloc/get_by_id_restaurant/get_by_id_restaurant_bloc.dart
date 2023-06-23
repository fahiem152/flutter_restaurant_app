// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/response/add_restaurant_response_model.dart';
import '../../data/models/response/restaurants_response_model.dart';
import '../../data/remote_datasource/restaurant_remote_datasource.dart';

part 'get_by_id_restaurant_bloc.freezed.dart';
part 'get_by_id_restaurant_event.dart';
part 'get_by_id_restaurant_state.dart';

class GetByIdRestaurantBloc
    extends Bloc<GetByIdRestaurantEvent, GetByIdRestaurantState> {
  final RestaurantRemoteDataSource dataSource;
  GetByIdRestaurantBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_$_GetByIdRestaurant>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.getByIdRestaurant(event.idRestaurant);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
