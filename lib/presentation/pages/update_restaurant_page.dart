// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/update_restaurant/update_restaurant_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

import 'package:flutter_restaurant/bloc/get_restaurant_by_uesr_id/get_restaurant_by_user_id_bloc.dart';
import 'package:flutter_restaurant/bloc/gmap/gmap_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
import 'package:flutter_restaurant/data/local_datasource/auth_local_datasource.dart';
import 'package:flutter_restaurant/data/models/response/restaurants_response_model.dart';
import 'package:flutter_restaurant/presentation/pages/gmap_page.dart';
import 'package:flutter_restaurant/presentation/widgets/text_input_widget.dart';

import '../../bloc/create_restaurant/create_restaurant_bloc.dart';
import '../../data/models/request/add_restaurant_request_model.dart';

class UpdateRestaurantPage extends StatefulWidget {
  static const routeName = '/update-restaurant-page';
  final Restaurant restaurant;
  const UpdateRestaurantPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  State<UpdateRestaurantPage> createState() => _UpdateRestaurantPageState();
}

class _UpdateRestaurantPageState extends State<UpdateRestaurantPage> {
  TextEditingController? nameController;
  TextEditingController? descriptionController;
  TextEditingController? addressController;

  XFile? picture;
  LocationData? currentLocation;

  LatLng? position;

  void takePicture(XFile file) {
    picture = file;
    setState(() {});
  }

  @override
  void initState() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    addressController = TextEditingController();
    context.read<GmapBloc>().add(const GmapEvent.getCurrentLocation());
    oldDataRestaurant();
    super.initState();
  }

  void oldDataRestaurant() {
    nameController!.text = widget.restaurant.attributes.name;
    descriptionController!.text = widget.restaurant.attributes.description;
    addressController!.text = widget.restaurant.attributes.address;
    position = LatLng(
      double.parse(widget.restaurant.attributes.latitude),
      double.parse(widget.restaurant.attributes.longitude),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    descriptionController!.dispose();
    addressController!.dispose();
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
          'Update Product Page',
          style: TextStyleConstant.h4,
        ),
        backgroundColor: ColorConstant.red,
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
            BlocBuilder<GmapBloc, GmapState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  loaded: (model) {
                    position = model.latLng;
                    addressController!.text = model.address ?? '';
                    print('address ${addressController!.text}');
                    return Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              decoration: BoxDecoration(
                                color: ColorConstant.red3,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Address: ${addressController!.text}',
                                    style: TextStyleConstant.textSemiBold6
                                        .copyWith(color: ColorConstant.black2),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Latitude: ${position!.latitude}',
                                    style: TextStyleConstant.textSemiBold6
                                        .copyWith(color: ColorConstant.black2),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Longitude: ${position!.longitude}',
                                    style: TextStyleConstant.textSemiBold6
                                        .copyWith(color: ColorConstant.black2),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstant.red4,
                                elevation: 4,
                              ),
                              onPressed: () {
                                print(model.latLng!.latitude);
                                print(model.latLng!.longitude);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return GmapPage(
                                    lat: model.latLng!.latitude,
                                    long: model.latLng!.longitude,
                                  );
                                }));
                              },
                              child: const Text('Ganti')),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 32,
            ),
            BlocConsumer<UpdateRestaurantBloc, UpdateRestaurantState>(
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
                        print('position!.latitude' +
                            position!.latitude.toString());
                        print('position!.longitude' +
                            position!.longitude.toString());
                        final userId = await AuthLocalDataSource().getUserId();
                        final addRestauranModel = AddRestaurantRequestModel(
                          data: DataRestaurant(
                            name: nameController!.text,
                            description: descriptionController!.text,
                            latitude: position == null
                                ? '0'
                                : position!.latitude.toString(),
                            longitude: position == null
                                ? '0'
                                : position!.longitude.toString(),
                            address: addressController!.text,
                            userId: userId,
                          ),
                        );
                        context.read<UpdateRestaurantBloc>().add(
                              UpdateRestaurantEvent.updateRestaurant(
                                addRestauranModel,
                                picture!,
                                widget.restaurant.id,
                              ),
                            );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text('Update Restaurant'),
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
}
