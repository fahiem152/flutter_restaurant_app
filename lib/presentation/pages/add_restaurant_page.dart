import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;

import 'package:flutter_restaurant/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:flutter_restaurant/bloc/get_location/get_location_bloc.dart';
import 'package:flutter_restaurant/bloc/get_restaurant_by_uesr_id/get_restaurant_by_user_id_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
import 'package:flutter_restaurant/data/local_datasource/auth_local_datasource.dart';
import 'package:flutter_restaurant/presentation/widgets/text_input_widget.dart';
import 'package:go_router/go_router.dart';

import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

import '../../bloc/create_restaurant/create_restaurant_bloc.dart';
import '../../data/models/request/add_restaurant_request_model.dart';

class AddRestaurantPage extends StatefulWidget {
  static const routeName = '/add-restaurant-page';
  const AddRestaurantPage({super.key});

  @override
  State<AddRestaurantPage> createState() => _AddRestaurantPageState();
}

class _AddRestaurantPageState extends State<AddRestaurantPage> {
  TextEditingController? nameController;
  TextEditingController? descriptionController;

  XFile? picture;
  LocationData? currentLocation;
  String address = "";
  bool isLoading = false;

  void takePicture(XFile file) {
    picture = file;
    setState(() {});
  }

  @override
  void initState() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    descriptionController!.dispose();
  }

  Future<void> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    if (photo != null) {
      setState(() {
        picture = photo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product Page',
          style: TextStyleConstant.h4,
        ),
        backgroundColor: ColorConstant.red,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            picture != null
                ? SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.file(
                      File(
                        picture!.path,
                      ),
                    ),
                  )
                : Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                  ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(
                //   onPressed: () async {
                //     // await availableCameras().then(
                //     //   (value) => Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //       builder: (_) {
                //     //         return CameraPage(
                //     //           takePicture: takePicture,
                //     //           cameras: value,
                //     //         );
                //     //       },
                //     //     ),
                //     //   ),
                //     // );
                //   },
                //   child: const Text(
                //     'Camera',
                //   ),
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.red4,
                    elevation: 4,
                  ),
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.cloud_upload_rounded,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Upload Image",
                        style: TextStyleConstant.textReguler6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Title Restaurant',
              style: TextStyleConstant.textSemiBold6.copyWith(
                color: ColorConstant.black,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextInputWidget(
              controller: nameController!,
              pleaceholder: 'Input Title',
              isPassword: false,
            ),
            const SizedBox(
              height: 16,
            ),

            const SizedBox(
              height: 16,
            ),
            Text(
              'Description Restaurant',
              style: TextStyleConstant.textSemiBold6.copyWith(
                color: ColorConstant.black,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextInputWidget(
              controller: descriptionController!,
              pleaceholder: 'Input Description',
              isPassword: false,
              maxLines: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            // BlocConsumer<GetLocationBloc, GetLocationState>(
            //   listener: (context, state) {
            //     state.maybeWhen(
            //       orElse: () {},
            //       loaded: (locationData, address) {
            //         return Column(
            //           children: [
            //             Text('Latitude: ${locationData.latitude}'),
            //             Text('Longitude: ${locationData.longitude}'),
            //             Text('Address: ${address}'),
            //           ],
            //         );
            //       },
            //       error: (message) {
            //         Text('Message $message');
            //       },
            //     );
            //   },
            //   builder: (context, state) {
            //     return state.maybeWhen(loading: () {
            //       return Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }, orElse: () {
            //       return ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: ColorConstant.red4,
            //           elevation: 4,
            //         ),
            //         onPressed: () {
            //           context
            //               .read<GetLocationBloc>()
            //               .add(GetLocationEvent.getLocation());
            //         },
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             const Icon(Icons.location_on),
            //             const SizedBox(
            //               width: 4,
            //             ),
            //             Text(
            //               "Get Location Restaurant",
            //               style: TextStyleConstant.textReguler6,
            //             ),
            //           ],
            //         ),
            //       );
            //     });
            //     // return ElevatedButton(
            //     //   style: ElevatedButton.styleFrom(
            //     //     backgroundColor: ColorConstant.red4,
            //     //     elevation: 4,
            //     //   ),
            //     //   onPressed: () {},
            //     //   child: Row(
            //     //     mainAxisAlignment: MainAxisAlignment.center,
            //     //     children: [
            //     //       const Icon(Icons.location_on),
            //     //       const SizedBox(
            //     //         width: 4,
            //     //       ),
            //     //       Text(
            //     //         "Get Location Restaurant",
            //     //         style: TextStyleConstant.textReguler6,
            //     //       ),
            //     //     ],
            //     //   ),
            //     // );
            //   },
            // ),

            isLoading == false
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.red4,
                      elevation: 4,
                    ),
                    onPressed: _getLocation,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Get Location Restaurant",
                          style: TextStyleConstant.textReguler6,
                        ),
                      ],
                    ),
                  )
                : Center(child: const CircularProgressIndicator()),

            currentLocation == null
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Berhasil mendapatkan lokasi',
                        style: TextStyleConstant.textReguler6,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 32,
            ),
            BlocConsumer<CreateRestaurantBloc, CreateRestaurantState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loaded: (model) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Add Product Success',
                        ),
                      ),
                    );
                    nameController!.clear();
                    descriptionController!.clear();

                    context.read<GetRestaurantByUserIdBloc>().add(
                        const GetRestaurantByUserIdEvent
                            .getRestaurantByUserId());
                    context.pop();
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message.error.message),
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.red,
                        elevation: 5,
                      ),
                      onPressed: () async {
                        final userId = await AuthLocalDataSource().getUserId();
                        final addRestauranModel = AddRestaurantRequestModel(
                          data: DataRestaurant(
                            name: nameController!.text,
                            description: descriptionController!.text,
                            latitude: currentLocation!.latitude.toString(),
                            longitude: currentLocation!.longitude.toString(),
                            address: address,
                            // latitude: latitudeController!.text,
                            // longitude: longitudeController!.text,
                            // address: addressController!.text,
                            userId: userId,
                          ),
                        );
                        context.read<CreateRestaurantBloc>().add(
                              CreateRestaurantEvent.createRestaurant(
                                addRestauranModel,
                                picture!,
                              ),
                            );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text('Add Restaurant'),
                      ),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _getLocation() {
    setState(() {
      isLoading = true;
    });
    _getLocationData().then((value) {
      LocationData? location = value;
      _getAddress(location?.latitude, location?.longitude).then((value) {
        setState(() {
          currentLocation = location;
          address = value;
          isLoading = false;
        });
      });
    });
  }
}

Future<LocationData?> _getLocationData() async {
  Location location = Location();
  LocationData locationData;

  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  locationData = await location.getLocation();

  return locationData;
}

Future<String> _getAddress(double? lat, double? lang) async {
  if (lat == null || lang == null) return "";

  final address = await geo.placemarkFromCoordinates(lat, lang);
  return "${address[0].street}, ${address[0].subLocality}, ${address[0].locality}, ${address[0].postalCode}";
}
