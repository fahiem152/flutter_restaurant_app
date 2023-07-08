import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:flutter_restaurant/bloc/get_search_restaurant/get_search_restaurant_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
import 'package:flutter_restaurant/presentation/pages/home_page.dart';
import 'package:flutter_restaurant/presentation/pages/my_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/profile_page.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSeacrhRestaurant = false;
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context
        .read<GetAllRestaurantBloc>()
        .add(const GetAllRestaurantEvent.getAllRestaurant());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.red3,
                  borderRadius: BorderRadius.circular(15),
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
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search for restaurant name',
                          hintStyle: TextStyleConstant.textMedium6.copyWith(
                            color: ColorConstant.black,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    BlocBuilder<GetSearchRestaurantBloc,
                        GetSearchRestaurantState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return IconButton(
                              onPressed: () {
                                setState(() {
                                  isSeacrhRestaurant = true;
                                });
                                context.read<GetSearchRestaurantBloc>().add(
                                        GetSearchRestaurantEvent
                                            .saerchRestaurant(
                                      _searchController.text,
                                    ));
                              },
                              icon: const Icon(
                                Icons.search,
                                color: ColorConstant.red2,
                              ),
                            );
                          },
                          loading: () {
                            return CircularProgressIndicator();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: isSeacrhRestaurant
                    ? BlocBuilder<GetSearchRestaurantBloc,
                        GetSearchRestaurantState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            loaded: (model) {
                              return ScrollConfiguration(
                                behavior: const ScrollBehavior().copyWith(
                                  scrollbars: false,
                                ),
                                child: ListView.builder(
                                  itemCount: model.data.length,
                                  itemBuilder: ((context, index) {
                                    return RestaurantCard(
                                      data: model.data[index],
                                    );
                                  }),
                                ),
                              );
                            },
                            error: (message) {
                              return Text(message.error.message);
                            },
                          );
                        },
                      )
                    : BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            loaded: (model) {
                              return ScrollConfiguration(
                                behavior: const ScrollBehavior().copyWith(
                                  scrollbars: false,
                                ),
                                child: ListView.builder(
                                  itemCount: model.data.length,
                                  itemBuilder: ((context, index) {
                                    return RestaurantCard(
                                      data: model.data[index],
                                    );
                                  }),
                                ),
                              );
                            },
                            error: (message) {
                              return Text(message.error.message);
                            },
                          );
                        },
                      ),
              )
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
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.home_rounded,
                        color: ColorConstant.red4,
                      ),
                      onPressed: () => context.push(HomePage.routeName)),
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
                        Icons.restaurant_rounded,
                        color: ColorConstant.red,
                      ),
                      onPressed: () {}),
                  Text(
                    'Search',
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
