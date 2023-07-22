part of 'update_restaurant_bloc.dart';

@freezed
class UpdateRestaurantState with _$UpdateRestaurantState {
  const factory UpdateRestaurantState.initial() = _Initial;
  const factory UpdateRestaurantState.loading() = _Loading;
  const factory UpdateRestaurantState.loaded(AddRestaurantResponseModel model) =
      _Loaded;
  const factory UpdateRestaurantState.error(ErrorResponseModel error) = _Error;
}
