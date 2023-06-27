import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_restaurant/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:image_picker/image_picker.dart';

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
  TextEditingController? latitudeController;
  TextEditingController? longitudeController;
  TextEditingController? addressController;
  // TextEditingController? userIdController;
  XFile? picture;

  void takePicture(XFile file) {
    picture = file;
    setState(() {});
  }

  @override
  void initState() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    latitudeController = TextEditingController();
    longitudeController = TextEditingController();
    addressController = TextEditingController();
    // userIdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    descriptionController!.dispose();
    latitudeController!.dispose();
    longitudeController!.dispose();
    addressController!.dispose();
    // userIdController!.dispose();
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
        title: const Text('Add Product Page'),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            picture != null
                ? SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.file(
                      File(
                        picture!.path,
                      ),
                    ),
                  )
                : Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                  ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // await availableCameras().then(
                    //   (value) => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (_) {
                    //         return CameraPage(
                    //           takePicture: takePicture,
                    //           cameras: value,
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // );
                  },
                  child: const Text(
                    'Camera',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  child: const Text(
                    'Galery',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: latitudeController,
              decoration: const InputDecoration(
                labelText: 'Latitude',
              ),
            ),
            TextField(
              controller: longitudeController,
              decoration: const InputDecoration(
                labelText: 'Longitude',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
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
                    latitudeController!.clear();
                    longitudeController!.clear();
                    addressController!.clear();
                    // userIdController!.clear();
                    context.pop();
                    context
                        .read<GetAllRestaurantBloc>()
                        .add(const GetAllRestaurantEvent.getAllRestaurant());
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
                      onPressed: () {
                        final addRestauranModel = AddRestaurantRequestModel(
                          data: DataRestaurant(
                            name: nameController!.text,
                            description: descriptionController!.text,
                            latitude: latitudeController!.text,
                            longitude: longitudeController!.text,
                            address: addressController!.text,
                            userId: 1,
                          ),
                        );
                        context.read<CreateRestaurantBloc>().add(
                              CreateRestaurantEvent.createRestaurant(
                                addRestauranModel,
                                picture!,
                              ),
                            );
                      },
                      child: const Text('Add Restaurant'),
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
