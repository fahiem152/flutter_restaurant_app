import 'package:flutter/material.dart';
import 'package:flutter_restaurant/data/models/directions.dart';
import 'package:go_router/go_router.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../common/color.constant.dart';

class DirectionPage extends StatefulWidget {
  final LatLng origin;
  final LatLng destination;
  const DirectionPage({
    Key? key,
    required this.origin,
    required this.destination,
  }) : super(key: key);

  @override
  State<DirectionPage> createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage> {
  late GoogleMapController mapController;
  late final Set<Marker> markers = {};
  final Set<Polyline> polylines = {};
  final Location location = Location();

  Future<void> setupLocation() async {
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        debugPrint('location service is not available');
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted == PermissionStatus.denied) {
        debugPrint('Location permission is denied');
        return;
      }
    }
  }

  bool isNavigationOn = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await setupLocation();
    });

    location.onLocationChanged.listen((event) {
      print('active');
      if (isNavigationOn) {
        print('active on');
        final latlng = LatLng(event.latitude!, event.longitude!);

        CameraPosition cameraPosition = CameraPosition(
          target: latlng,
          zoom: 16,
          tilt: 80,
          bearing: 30,
        );

        mapController.animateCamera(
          CameraUpdate.newCameraPosition(cameraPosition),
        );

        setState(() {
          markers.removeWhere((element) => element.markerId.value == 'source');
          markers.add(Marker(
            markerId: const MarkerId('source'),
            position: latlng,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ));
        });
      }
    });
  }

  Future<void> setPolylines(LatLng origin, LatLng destination) async {
    final result = await Direction.getDirections(
      googleMapsApiKey: 'AIzaSyAkAU2Dx4hz-X1OAFzGy38q15V9Miw0gkA', //asli
      origin: origin,
      destination: destination,
    );

    final polylineCoordinates = <LatLng>[];
    if (result != null && result.polylinePoints.isNotEmpty) {
      polylineCoordinates.addAll(result.polylinePoints);
    }

    final polyline = Polyline(
      polylineId: const PolylineId('default-polyline'),
      color: Colors.blue,
      width: 7,
      points: polylineCoordinates,
    );

    setState(() {
      polylines.add(polyline);
    });

    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(result!.bounds, 50),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: widget.origin,
                zoom: 18,
              ),
              markers: markers,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,
              polylines: polylines,
              onMapCreated: (controller) {
                final originMarker = Marker(
                  markerId: const MarkerId('source'),
                  position: widget.origin,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                );

                final destinationMarker = Marker(
                  markerId: const MarkerId('destination'),
                  position: widget.destination,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                );

                setState(() {
                  mapController = controller;
                  markers.addAll([originMarker, destinationMarker]);
                });
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  width: 45,
                  height: 45,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorConstant.red4.withOpacity(
                      0.5,
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: ColorConstant.white,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 16,
                right: 16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: () async {
                        markers.removeWhere(
                            (element) => element.markerId.value == 'source');
                        markers.add(Marker(
                            markerId: const MarkerId('source'),
                            position: widget.origin,
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueRed)));
                        markers.add(Marker(
                            markerId: const MarkerId('des'),
                            position: widget.destination,
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueRed)));
                        setState(() {});
                        await setPolylines(widget.origin, widget.destination);
                      },
                      child: const Icon(Icons.navigation),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          isNavigationOn = true;
                        });
                      },
                      child: const Icon(Icons.run_circle),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
