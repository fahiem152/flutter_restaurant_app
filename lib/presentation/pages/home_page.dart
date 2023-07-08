import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';

import 'package:flutter_restaurant/presentation/pages/my_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/profile_page.dart';
import 'package:flutter_restaurant/presentation/pages/search_page.dart';

import 'package:flutter_restaurant/presentation/widgets/card_restaurant_widget.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/get_all_restaurant/get_all_restaurant_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context
        .read<GetAllRestaurantBloc>()
        .add(const GetAllRestaurantEvent.getAllRestaurant());
  }

  final List<String> imgList = [
    'assets/images/promo1.jpg',
    'assets/images/promo2.jpg',
    'assets/images/promo3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.sort),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: ColorConstant.red2,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Demak, Indonesia',
                        style: TextStyleConstant.p1.copyWith(
                          color: ColorConstant.black,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    child: Image.asset('assets/images/person.png'),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              CarouselSlider(
                options: CarouselOptions(height: 150),
                items: imgList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: ColorConstant.red2,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                children: [
                  Text('Popular Restaurant', style: TextStyleConstant.h4),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      context.push(
                        SearchPage.routeName,
                      );
                    },
                    child: Text(
                      'See All >',
                      style: TextStyleConstant.textBold5.copyWith(
                        color: ColorConstant.red,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                child: BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loaded: (model) {
                        return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 10,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 9 / 10,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) {
                              return CardRestaurantWidget(
                                restaurant: model.data[index],
                              );
                            });
                      },
                      error: (message) {
                        return Text(message.error.message);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
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
                        Icons.home_rounded,
                        color: ColorConstant.red,
                      ),
                      onPressed: () {}),
                  Text(
                    'Home',
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
  }
}
