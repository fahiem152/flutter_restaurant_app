// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant/data/remote_datasource/user_remote_datasource.dart';

import '../../data/models/request/update_user_request_model.dart';
import '../../data/models/response/auth_response_model.dart';
import '../../data/models/response/error_response_model.dart';

part 'update_profile_bloc.freezed.dart';
part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final UserRemoteDataSource dataSource;
  UpdateProfileBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_UpdateProfile>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.updateUser(event.idUser, event.model);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
