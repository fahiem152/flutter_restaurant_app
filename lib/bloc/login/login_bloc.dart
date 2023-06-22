import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/request/login_request_model.dart';
import '../../data/models/response/auth_response_model.dart';
import '../../data/remote_datasource/auth_remote_datasource.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDataSource datasource;
  LoginBloc(this.datasource) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.login(event.model);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
