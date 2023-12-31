import 'package:flutter_bloc/flutter_bloc.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_restaurant/bloc/get_by_id_restaurant/get_by_id_restaurant_bloc.dart';
import 'package:flutter_restaurant/bloc/gmap/gmap_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
import 'package:flutter_restaurant/presentation/pages/direction_page.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
    context.read<GmapBloc>().add(const GmapEvent.getCurrentLocation());
    super.initState();
  }

  final Set<Marker> markers = {};

  LatLng? position;

  void createMarker(double lat, double lng, String address) {
    final marker = Marker(
        markerId: const MarkerId('currentPosition'),
        infoWindow: InfoWindow(title: address),
        position: LatLng(lat, lng));

    markers.add(marker);
  }

  Future<bool> _getPermission(Location location) async {
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }

  LatLng? positionDestination;

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

              positionDestination = LatLng(lat, lng);
              print('latlng: $lat, $lng');
              position = LatLng(lat, lng);
              createMarker(lat, lng, model.data.attributes.address);
              return SafeArea(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          Image.network(model.data.attributes.photo),
                          InkWell(
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
                          )
                        ],
                      ),
                      Container(
                        color: ColorConstant.white,
                        padding: const EdgeInsets.all(
                          24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.red3,
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Popular',
                                      style: TextStyleConstant.textMedium6
                                          .copyWith(
                                        color: ColorConstant.red,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.red3,
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: ColorConstant.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              model.data.attributes.name,
                              style: TextStyleConstant.textMedium2.copyWith(
                                color: ColorConstant.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              model.data.attributes.address,
                              style: TextStyleConstant.textReguler3.copyWith(
                                color: ColorConstant.black,
                              ),
                            ),
                            Text(
                              model.data.attributes.latitude,
                              style: TextStyleConstant.textReguler5.copyWith(
                                color: ColorConstant.black,
                              ),
                            ),
                            Text(
                              model.data.attributes.longitude,
                              style: TextStyleConstant.textReguler5.copyWith(
                                color: ColorConstant.black,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            RatingBar.builder(
                              itemSize: 20,
                              initialRating: 3.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              model.data.attributes.description,
                              style: TextStyleConstant.textMedium6.copyWith(
                                color: ColorConstant.black2,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              height: 300,
                              child: Card(
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
                              ),
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            BlocBuilder<GmapBloc, GmapState>(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  error: (error) {
                                    return Text('error: $error');
                                  },
                                  loaded: (model) {
                                    return SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 5,
                                          backgroundColor: ColorConstant.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return DirectionPage(
                                                  origin: model.latLng!,
                                                  destination:
                                                      positionDestination!,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Directions',
                                          style: TextStyleConstant.textBold5
                                              .copyWith(
                                            color: ColorConstant.white,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
