import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/response/error_response_model.dart';
import '../../data/models/response/restaurants_response_model.dart';

part 'delete_resataurant_event.dart';
part 'delete_resataurant_state.dart';
part 'delete_resataurant_bloc.freezed.dart';

class DeleteResataurantBloc
    extends Bloc<DeleteResataurantEvent, DeleteResataurantState> {
  final RestaurantRemoteDataSource dataSource;

  DeleteResataurantBloc(this.dataSource) : super(const _Initial()) {
    on<_DeleteRestaurant>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.deleteRestaurant(event.idRestaurant);
      result.fold(
        (l) => emit(_$Error(l)),
        (r) => emit(
          _$_Loaded(
            r,
          ),
        ),
      );
    });
  }
}
