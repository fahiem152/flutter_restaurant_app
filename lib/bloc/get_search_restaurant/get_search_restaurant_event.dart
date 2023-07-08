part of 'get_search_restaurant_bloc.dart';

@freezed
class GetSearchRestaurantEvent with _$GetSearchRestaurantEvent {
  const factory GetSearchRestaurantEvent.started() = _Started;
  const factory GetSearchRestaurantEvent.saerchRestaurant(
    String keyRestaurant,
  ) = _SaerchRestaurant;
}
