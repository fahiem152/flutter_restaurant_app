import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/get_user_by_id/get_user_by_id_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/converts.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
import 'package:flutter_restaurant/presentation/pages/home_page.dart';
import 'package:flutter_restaurant/presentation/pages/my_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/search_page.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<GetUserByIdBloc>().add(
          const GetUserByIdEvent.getUSerById(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: ColorConstant.red3,
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: ColorConstant.red,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: ColorConstant.red3,
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.notification_add_rounded,
                              color: ColorConstant.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Profile',
                      style: TextStyleConstant.textBold3.copyWith(
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: SizedBox(
                        width: 128,
                        height: 128,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                // color: ColorConstant.red3,
                                borderRadius: BorderRadius.circular(
                                  64,
                                ),
                                border: Border.all(
                                  color: ColorConstant.red3,
                                  width: 8,
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 64,
                                backgroundImage: AssetImage(
                                  'assets/images/person.png',
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: ColorConstant.red,
                                  border: Border.all(
                                    color: ColorConstant.white,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    16,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.edit_rounded,
                                  color: ColorConstant.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Personal Info',
                      style: TextStyleConstant.textBold4,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => Center(
                            child: CircularProgressIndicator(),
                          ),
                          loaded: (model) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'ID',
                                        style: TextStyleConstant.textMedium5,
                                      ),
                                      Text(
                                        model.id.toString(),
                                        style: TextStyleConstant.textSemiBold5,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Username',
                                        style: TextStyleConstant.textMedium5,
                                      ),
                                      Text(
                                        model.username,
                                        style: TextStyleConstant.textSemiBold5,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyleConstant.textMedium5,
                                      ),
                                      Text(
                                        model.email,
                                        style: TextStyleConstant.textSemiBold5,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Registered User',
                                        style: TextStyleConstant.textMedium5,
                                      ),
                                      Text(
                                        Converts().convertDateString(
                                            model.createdAt.toString()),
                                        style: TextStyleConstant.textSemiBold5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        minimumSize: Size(
                          MediaQuery.of(context).size.width,
                          48,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Edit',
                        style: TextStyleConstant.textSemiBold5.copyWith(
                          color: ColorConstant.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/pattern_profile.png',
            ),
          ],
        ),
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
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.restaurant_menu_rounded,
                      color: ColorConstant.red4,
                    ),
                    onPressed: () => context.push(
                      MyRestaurantPage.routeName,
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
                        Icons.person_rounded,
                        color: ColorConstant.red,
                      ),
                      onPressed: () {}),
                  Text(
                    'Profile',
                    style: TextStyleConstant.p1.copyWith(
                      color: ColorConstant.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
