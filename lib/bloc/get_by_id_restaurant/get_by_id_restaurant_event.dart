part of 'get_by_id_restaurant_bloc.dart';

@freezed
class GetByIdRestaurantEvent with _$GetByIdRestaurantEvent {
  const factory GetByIdRestaurantEvent.started() = _Started;
  const factory GetByIdRestaurantEvent.getByIdRestaurant(int idRestaurant) =
      _GetByIdRestaurant;
}
