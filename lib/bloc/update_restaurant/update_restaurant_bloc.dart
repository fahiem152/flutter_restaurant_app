import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/constants.dart';
import '../../data/models/request/add_restaurant_request_model.dart';
import '../../data/models/response/add_restaurant_response_model.dart';
import '../../data/models/response/error_response_model.dart';

part 'update_restaurant_event.dart';
part 'update_restaurant_state.dart';
part 'update_restaurant_bloc.freezed.dart';

class UpdateRestaurantBloc
    extends Bloc<UpdateRestaurantEvent, UpdateRestaurantState> {
  final RestaurantRemoteDataSource dataSource;
  UpdateRestaurantBloc(this.dataSource) : super(const _Initial()) {
    on<_UpdateRestaurant>((event, emit) async {
      emit(const _Loading());

      final uploadResult = await dataSource.uploadImage(event.image!);
      await Future.sync(() => uploadResult.fold(
            (l) => emit(_Error(l)),
            (dataUpload) async {
              final result = await dataSource.updateRestaurant(
                AddRestaurantRequestModel(
                    data: event.model.data.copyWith(
                        photo: '${Constants.baseUrl}${dataUpload.url!}')),
                event.idRestaurant,
              );

              result.fold(
                (l) => emit(_Error(l)),
                (r) => emit(_Loaded(r)),
              );
            },
          ));
    });
  }
}
