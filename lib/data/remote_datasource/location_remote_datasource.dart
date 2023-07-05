import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

class LocationRemoteDataSource {
  Future<Either<String, LocationData>> getLocationData() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception('Location service is disabled');
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Location permission denied');
      }
    }

    LocationData locationData = await location.getLocation();
    if (locationData != null) {
      return Right(locationData);
    } else {
      return Left('Error get Location Data');
    }
  }

  Future<Either<String, String>> getAddress(double? lat, double? lang) async {
    if (lat == null || lang == null) {
      return Left('Error Get Address');
    }

    final address = await geo.placemarkFromCoordinates(lat, lang);
    return Right(
        "${address[0].street}, ${address[0].subLocality}, ${address[0].locality}, ${address[0].postalCode}");
  }
}
