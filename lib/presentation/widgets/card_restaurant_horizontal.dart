import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_restaurant/bloc/get_restaurant_by_uesr_id/get_restaurant_by_user_id_bloc.dart';
import 'package:flutter_restaurant/presentation/pages/update_restaurant_page.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/delete_restaurant/delete_resataurant_bloc.dart';
import '../../common/color.constant.dart';
import '../../common/textstyle.constant.dart';
import '../../data/models/response/restaurants_response_model.dart';
import '../pages/detail_restaurant_page.dart';

class RestaurantCard extends StatelessWidget {
  final bool isUser;
  const RestaurantCard({
    Key? key,
    this.isUser = false,
    required this.data,
  }) : super(key: key);
  final Restaurant data;
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Konfirmasi Hapus',
            style: TextStyleConstant.textBold4
                .copyWith(color: ColorConstant.black),
          ),
          content: Text(
            'Apakah Anda yakin ingin data menghapus restoran "${data.attributes.name}"?',
            style: TextStyleConstant.textReguler5.copyWith(
              color: ColorConstant.black,
            ),
            textAlign: TextAlign.justify,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Tidak',
                style: TextStyleConstant.textReguler5.copyWith(
                  color: ColorConstant.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            BlocConsumer<DeleteResataurantBloc, DeleteResataurantState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loaded: (model) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('${model.attributes.name} Succes delete')));
                    context.read<GetRestaurantByUserIdBloc>().add(
                        GetRestaurantByUserIdEvent.getRestaurantByUserId());
                    context.pop();
                  },
                  error: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('${error.error.message} Failed delete')));
                    context.pop();
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                    loading: () => CircularProgressIndicator(),
                    orElse: () {
                      return TextButton(
                        child: Text(
                          'Ya',
                          style: TextStyleConstant.textMedium5
                              .copyWith(color: ColorConstant.red),
                        ),
                        onPressed: () {
                          context.read<DeleteResataurantBloc>().add(
                                DeleteResataurantEvent.deleteRestaurant(
                                  data.id,
                                ),
                              );
                        },
                      );
                    });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('${DetailRestaurantPage.routeName}/${data.id}'),
      child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(
              12,
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      data.attributes.photo ?? 'https://picsum.photos/200/300',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.attributes.name,
                        style: TextStyleConstant.textSemiBold5,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        data.attributes.address,
                        style: TextStyleConstant.textReguler6,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                isUser
                    ? PopupMenuButton<String>(
                        onSelected: (value) {
                          // Di sini Anda dapat menangani setiap pilihan yang dipilih
                          if (value == 'edit') {
                            // Aksi saat pilihan 'edit' dipilih
                            print('Edit clicked');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateRestaurantPage(
                                        restaurant: data)));
                          } else if (value == 'delete') {
                            _showDeleteConfirmationDialog(context);
                            print('Delete clicked');
                          }
                        },
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem<String>(
                              value: 'edit',
                              child: Container(
                                child: Text(
                                  'Edit',
                                  style:
                                      TextStyleConstant.textReguler5.copyWith(
                                    color: ColorConstant.black2,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'delete',
                              child: Text(
                                'Delete',
                                style: TextStyleConstant.textReguler5.copyWith(
                                  color: ColorConstant.red4,
                                ),
                              ),
                            ),
                          ];
                        },
                      )
                    : SizedBox(),
              ],
            ),
          )),
    );
  }
}
