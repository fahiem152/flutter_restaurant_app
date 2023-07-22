// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_restaurant/bloc/get_restaurant_by_uesr_id/get_restaurant_by_user_id_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';

import 'package:flutter_restaurant/presentation/pages/add_restaurant_page.dart';

import 'package:flutter_restaurant/presentation/pages/home_page.dart';
import 'package:flutter_restaurant/presentation/pages/profile_page.dart';
import 'package:flutter_restaurant/presentation/pages/search_page.dart';

import '../widgets/card_restaurant_horizontal.dart';

class MyRestaurantPage extends StatefulWidget {
  static const routeName = '/my-restaurant';
  const MyRestaurantPage({super.key});

  @override
  State<MyRestaurantPage> createState() => _MyRestaurantPageState();
}

class _MyRestaurantPageState extends State<MyRestaurantPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<GetRestaurantByUserIdBloc>()
        .add(const GetRestaurantByUserIdEvent.getRestaurantByUserId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.red,
        automaticallyImplyLeading: false,
        title: Text(
          'My Restaurant',
          style: TextStyleConstant.h4,
        ),
        // centerTitle: true,
        actions: [
          InkWell(
            onTap: () => context.push(AddRestaurantPage.routeName),
            child: Container(
              margin: const EdgeInsets.all(
                8,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                color: ColorConstant.white,
              ),
              child: Center(
                child: Text(
                  'Add Resto',
                  style: TextStyleConstant.textReguler6.copyWith(
                    color: ColorConstant.red,
                  ),
                ),
              ),
            ),
          ),
          // IconButton(
          //     onPressed: () async {
          //       await AuthLocalDataSource().removeAuthData();
          //       context.go(LoginPage.routeName);
          //     },
          //     icon: Icon(Icons.logout)),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.push(AddRestaurantPage.routeName);
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: BlocBuilder<GetRestaurantByUserIdBloc,
                GetRestaurantByUserIdState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (message) => Center(
                    child: Text(message.error.message),
                  ),
                  loaded: (data) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return RestaurantCard(
                          data: data.data[index],
                          isUser: true,
                        );
                      },
                      itemCount: data.data.length,
                    );
                  },
                );
              },
            )),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 8.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 0,
              offset: const Offset(0, 1),
              color: Colors.black.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 0,
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.home_rounded,
                      color: ColorConstant.red4,
                    ),
                    onPressed: () => context.push(
                      HomePage.routeName,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.restaurant_rounded,
                      color: ColorConstant.red4,
                    ),
                    onPressed: () => context.push(
                      SearchPage.routeName,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorConstant.red3,
                borderRadius: BorderRadius.circular(15),
              ),
              width: MediaQuery.of(context).size.width / 4,
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.restaurant_menu_rounded,
                        color: ColorConstant.red,
                      ),
                      onPressed: () {}),
                  Text(
                    'Resto',
                    style: TextStyleConstant.p1
                        .copyWith(color: ColorConstant.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.person_rounded,
                      color: ColorConstant.red4,
                    ),
                    onPressed: () => context.push(
                      ProfilePage.routeName,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // return Center(
    //   child: IconButton(
    //     onPressed: () {
    //       context.push(AddRestaurantPage.routeName);
    //     },
    //     icon: const Icon(
    //       Icons.add_circle_outline_rounded,
    //       color: Colors.blue,
    //       size: 32,
    //     ),
    //   ),
    // );
  }
}
