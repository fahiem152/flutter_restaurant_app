import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
import 'package:flutter_restaurant/presentation/pages/home_page.dart';
import 'package:flutter_restaurant/presentation/pages/my_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/search_page.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Page'),
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
