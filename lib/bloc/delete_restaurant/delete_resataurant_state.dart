part of 'delete_resataurant_bloc.dart';

@freezed
class DeleteResataurantState with _$DeleteResataurantState {
  const factory DeleteResataurantState.initial() = _Initial;
  const factory DeleteResataurantState.loading() = _Loading;
  const factory DeleteResataurantState.loaded(Restaurant model) = _Loaded;
  const factory DeleteResataurantState.error(ErrorResponseModel error) = Error;
}
