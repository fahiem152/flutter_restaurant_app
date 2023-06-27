part of 'get_by_id_restaurant_bloc.dart';

@freezed
class GetByIdRestaurantState with _$GetByIdRestaurantState {
  const factory GetByIdRestaurantState.initial() = _Initial;
  const factory GetByIdRestaurantState.loading() = _Loading;
  const factory GetByIdRestaurantState.loaded(
      AddRestaurantResponseModel model) = _Loaded;
  const factory GetByIdRestaurantState.error(ErrorResponseModel message) = _Error;
}
