part of 'get_restaurant_by_user_id_bloc.dart';

@freezed
class GetRestaurantByUserIdEvent with _$GetRestaurantByUserIdEvent {
  const factory GetRestaurantByUserIdEvent.started() = _Started;
  const factory GetRestaurantByUserIdEvent.getRestaurantByUserId() =
      _GetRestaurantByUserId;
}
