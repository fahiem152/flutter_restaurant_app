part of 'get_restaurant_by_user_id_bloc.dart';

@freezed
class GetRestaurantByUserIdState with _$GetRestaurantByUserIdState {
  const factory GetRestaurantByUserIdState.initial() = _Initial;
  const factory GetRestaurantByUserIdState.loading() = _Loading;
  const factory GetRestaurantByUserIdState.loaded(
      RestaurantsResponseModel model) = _Loaded;
  const factory GetRestaurantByUserIdState.error(ErrorResponseModel message) =
      _Error;
}
