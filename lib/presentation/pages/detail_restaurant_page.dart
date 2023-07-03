import 'package:flutter_bloc/flutter_bloc.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/bloc/get_by_id_restaurant/get_by_id_restaurant_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailRestaurantPage extends StatefulWidget {
  final int idRestaurant;
  static const routeName = '/detai_restaurant';
  const DetailRestaurantPage({
    Key? key,
    required this.idRestaurant,
  }) : super(key: key);

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  @override
  void initState() {
    context
        .read<GetByIdRestaurantBloc>()
        .add(GetByIdRestaurantEvent.getByIdRestaurant(widget.idRestaurant));
    super.initState();
  }

  final Set<Marker> markers = {};

  void createMarker(double lat, double lng, String address) {
    final marker = Marker(
      markerId: const MarkerId(
        'currentPosition',
      ),
      infoWindow: InfoWindow(
        title: address,
      ),
      position: LatLng(
        lat,
        lng,
      ),
    );
    markers.add(marker);
  }
  // Future<bool> _getPermission(Location location) async {
  //   late bool serviceEnabled;
  //   late PermissionStatus permissionGranted;

  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       return false;
  //     }
  //   }
  // }
  //  permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       return false;
  //     }
  //   }

  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    debugPrint('idRestaurant ${widget.idRestaurant}');
    return Scaffold(
      body: BlocBuilder<GetByIdRestaurantBloc, GetByIdRestaurantState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(child: CircularProgressIndicator());
            },
            loaded: (model) {
              final lat = double.parse(model.data.attributes.latitude);
              final lng = double.parse(model.data.attributes.longitude);
              print('latlng: $lat, $lng');
              createMarker(lat, lng, model.data.attributes.address);
              return ListView(
                children: [
                  Stack(
                    children: [
                      Image.network(model.data.attributes.photo),
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.5),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    model.data.attributes.name,
                  ),
                  Text(
                    model.data.attributes.description,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 500,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: markers,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          lat,
                          lng,
                        ),
                        zoom: 15,
                      ),
                    ),
                  )
                ],
              );
            },
            error: (model) {
              return Text(model.error.message);
            },
          );
        },
      ),
    );
  }
}
