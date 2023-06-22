// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant/data/remote_datasource/auth_remote_datasource.dart';

import '../../../data/models/request/register_request_model.dart';
import '../../../data/models/response/auth_response_model.dart';
import '../../data/models/response/error_response_model.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDataSource dataSource;
  RegisterBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.register(event.model);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
