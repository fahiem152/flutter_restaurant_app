part of 'delete_resataurant_bloc.dart';

@freezed
class DeleteResataurantEvent with _$DeleteResataurantEvent {
  const factory DeleteResataurantEvent.started() = _Started;
  const factory DeleteResataurantEvent.deleteRestaurant(int idRestaurant) =
      _DeleteRestaurant;
}
