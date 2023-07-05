part of 'get_location_bloc.dart';

@freezed
class GetLocationState with _$GetLocationState {
  const factory GetLocationState.initial() = _Initial;
  const factory GetLocationState.loading() = _Loading;
  const factory GetLocationState.loaded(
      LocationData locationData, String address) = _Loaded;
  const factory GetLocationState.error(String message) = _Error;
}
