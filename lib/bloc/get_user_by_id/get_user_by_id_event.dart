part of 'get_user_by_id_bloc.dart';

@freezed
class GetUserByIdEvent with _$GetUserByIdEvent {
  const factory GetUserByIdEvent.started() = _Started;
  const factory GetUserByIdEvent.getUSerById() = _GetUSerById;
}
