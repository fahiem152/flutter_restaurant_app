// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';

import 'package:flutter_restaurant/data/remote_datasource/location_remote_datasource.dart';

part 'get_location_bloc.freezed.dart';
part 'get_location_event.dart';
part 'get_location_state.dart';

class GetLocationBloc extends Bloc<GetLocationEvent, GetLocationState> {
  final LocationRemoteDataSource dataSource;
  GetLocationBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_GetLocation>((event, emit) async {
      emit(const _Loading());
      final resultLoactionData = await dataSource.getLocationData();
      await Future.sync(
        () => resultLoactionData.fold(
          (l) => emit(const _Error('Error resultLoactionData')),
          (locationData) async {
            final resultAddres = await dataSource.getAddress(
                locationData.latitude, locationData.longitude);

            resultAddres.fold(
              (l) => emit(const _Error('Erro Result Address')),
              (r) => emit(
                _Loaded(
                  locationData,
                  r,
                ),
              ),
            );
          },
        ),
      );
      // Future<LocationData> _getLocationData() async {
      //   Location location = Location();

      //   bool serviceEnabled = await location.serviceEnabled();
      //   if (!serviceEnabled) {
      //     serviceEnabled = await location.requestService();
      //     if (!serviceEnabled) {
      //       throw Exception('Location service is disabled');
      //     }
      //   }

      //   PermissionStatus permissionGranted = await location.hasPermission();
      //   if (permissionGranted == PermissionStatus.denied) {
      //     permissionGranted = await location.requestPermission();
      //     if (permissionGranted != PermissionStatus.granted) {
      //       throw Exception('Location permission denied');
      //     }
      //   }

      //   LocationData locationData = await location.getLocation();
      //   return locationData;
      // }

      // Future<String> _getAddress(double? lat, double? lang) async {
      //   if (lat == null || lang == null) return "";

      //   final address = await geo.placemarkFromCoordinates(lat, lang);
      //   return "${address[0].street}, ${address[0].subLocality}, ${address[0].locality}, ${address[0].postalCode}";
      // }
      // Future<LocationData> _getLocationData() async {
      //   Location location = Location();

      //   bool serviceEnabled = await location.serviceEnabled();
      //   if (!serviceEnabled) {
      //     serviceEnabled = await location.requestService();
      //     if (!serviceEnabled) {
      //       throw Exception('Location service is disabled');
      //     }
      //   }

      //   PermissionStatus permissionGranted = await location.hasPermission();
      //   if (permissionGranted == PermissionStatus.denied) {
      //     permissionGranted = await location.requestPermission();
      //     if (permissionGranted != PermissionStatus.granted) {
      //       throw Exception('Location permission denied');
      //     }
      //   }

      //   LocationData locationData = await location.getLocation();
      //   return locationData;
      // }

      // Future<String> _getAddress(double? lat, double? lang) async {
      //   if (lat == null || lang == null) return "";

      //   final address = await geo.placemarkFromCoordinates(lat, lang);
      //   return "${address[0].street}, ${address[0].subLocality}, ${address[0].locality}, ${address[0].postalCode}";
      // }
      // final locationData = await _getLocationData();

      // final address =
      //     await _getAddress(locationData.latitude, locationData.longitude);
      // if (locationData != null && address != null) {
      //   print('suksee');
      //   emit(_Loaded(locationData, address));
      // } else {
      //   print('Gagal');
      //   emit(_$_Error('Error'));
      // }

      // try {
      //   final locationData = await _getLocationData();

      //   final address =
      //       await _getAddress(locationData.latitude, locationData.longitude);

      //   debugPrint(locationData.latitude.toString());
      //   debugPrint(address);

      //   emit(_Loaded(locationData, address));
      // } catch (e) {
      //   emit(_Error(e.toString()));
      // }
    });
  }
}
