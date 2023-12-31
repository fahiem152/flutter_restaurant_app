// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant/data/models/gmpa_model.dart';
import 'package:flutter_restaurant/data/remote_datasource/gmap_remote_datasource.dart';

part 'gmap_bloc.freezed.dart';
part 'gmap_event.dart';
part 'gmap_state.dart';

class GmapBloc extends Bloc<GmapEvent, GmapState> {
  final GmapDatasource datasource;
  GmapBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_GetCurrentLocation>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getCurrentPosition();
      result.fold(
        (l) => emit(_$_Error(l)),
        (r) => emit(
          _$_Loaded(r),
        ),
      );
    });
    on<_GetSelectPosition>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getPosition(
        lat: event.lat,
        long: event.long,
      );
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
