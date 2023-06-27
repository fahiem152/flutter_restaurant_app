import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/constants.dart';
import '../../data/models/request/add_restaurant_request_model.dart';
import '../../data/models/response/add_restaurant_response_model.dart';
import '../../data/models/response/error_response_model.dart';
import '../../data/remote_datasource/restaurant_remote_datasource.dart';

part 'create_restaurant_event.dart';
part 'create_restaurant_state.dart';
part 'create_restaurant_bloc.freezed.dart';

class CreateRestaurantBloc
    extends Bloc<CreateRestaurantEvent, CreateRestaurantState> {
  final RestaurantRemoteDataSource datasource;
  CreateRestaurantBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_CreateRestaurant>((event, emit) async {
      emit(const _Loading());

      // final result = await datasource.createRestaurant(event.model);
      // result.fold(
      //   (l) => emit(_Error(l)),
      //   (r) => emit(_Loaded(r)),
      // );
      final uploadResult = await datasource.uploadImage(event.image);
      uploadResult.fold(
        (l) => emit(_Error(l)),
        (dataUpload) async {
          final result = await datasource.createRestaurant(
            event.model.copyWith(
              data: event.model.data
                  .copyWith(photo: '${Constants.baseUrl}${dataUpload.url}'),
            ),
          );
          result.fold(
            (l) => emit(_Error(l)),
            (r) => emit(_Loaded(r)),
          );
        },
      );
    });
  }
}
