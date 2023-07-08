part of 'get_search_restaurant_bloc.dart';

@freezed
class GetSearchRestaurantState with _$GetSearchRestaurantState {
  const factory GetSearchRestaurantState.initial() = _Initial;
  const factory GetSearchRestaurantState.loading() = _Loading;
  const factory GetSearchRestaurantState.loaded(
      RestaurantsResponseModel model) = _Loaded;
  const factory GetSearchRestaurantState.error(ErrorResponseModel message) =
      _Error;
}
