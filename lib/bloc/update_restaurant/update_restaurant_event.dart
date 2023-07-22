part of 'update_restaurant_bloc.dart';

@freezed
class UpdateRestaurantEvent with _$UpdateRestaurantEvent {
  const factory UpdateRestaurantEvent.started() = _Started;
  const factory UpdateRestaurantEvent.updateRestaurant(
          AddRestaurantRequestModel model, XFile image, int idRestaurant) =
      _UpdateRestaurant;
}
