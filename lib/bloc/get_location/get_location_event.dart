part of 'get_location_bloc.dart';

@freezed
class GetLocationEvent with _$GetLocationEvent {
  const factory GetLocationEvent.started() = _Started;
  const factory GetLocationEvent.getLocation() = _GetLocation;
  // const factory GetLocationEvent.getLocationData() = _GetLocationData;
  // const factory GetLocationEvent.address(double? lat, double? lang) = _Address;
}
