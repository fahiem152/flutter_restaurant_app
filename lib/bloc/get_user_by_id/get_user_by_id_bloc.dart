// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/data/local_datasource/auth_local_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant/data/models/response/auth_response_model.dart';
import 'package:flutter_restaurant/data/models/response/error_response_model.dart';
import 'package:flutter_restaurant/data/remote_datasource/user_remote_datasource.dart';

part 'get_user_by_id_bloc.freezed.dart';
part 'get_user_by_id_event.dart';
part 'get_user_by_id_state.dart';

class GetUserByIdBloc extends Bloc<GetUserByIdEvent, GetUserByIdState> {
  final UserRemoteDataSource userRemoteDataSource;
  GetUserByIdBloc(
    this.userRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetUSerById>((event, emit) async {
      emit(const _Loading());
      final userId = await AuthLocalDataSource().getUserId();
      final result = await userRemoteDataSource.getUser(userId!);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
