import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
import 'package:flutter_restaurant/presentation/pages/add_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/my_restaurant_page.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.sort),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: ColorConstant.red2,
                      ),
                      SizedBox(
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
                ),
                CircleAvatar(
                  child: Image.asset('assets/images/person.png'),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 150),
              items: imgList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(12),
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text(
            //       'List Restaurant',
            //       style: TextStyle(
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         context.push(AddRestaurantPage.routeName);
            //       },
            //       icon: const Icon(
            //         Icons.add_circle_outline_rounded,
            //         color: Colors.blue,
            //         size: 32,
            //       ),
            //     ),
            //   ],
            // ),

            Row(
              children: [
                Text('Popular Restaurant', style: TextStyleConstant.h4),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // context.push(AddRestaurantPage.routeName);
                  },
                  child: Text('See All >-',
                      style: TextStyleConstant.p1
                          .copyWith(color: ColorConstant.red2)),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (model) {
                      return ScrollConfiguration(
                        behavior:
                            const ScrollBehavior().copyWith(overscroll: false),
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: model.data.length,
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
                            }),
                      );
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (value) {
          if (value == 1) {
            context.push(MyRestaurantPage.routeName);
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant), label: 'All Restaurant'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'My Account'),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 16),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       const SizedBox(
    //         height: 12,
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Icon(Icons.sort),
    //           Container(
    //             child: Row(
    //               children: [
    //                 Icon(
    //                   Icons.location_on,
    //                   color: ColorConstant.red2,
    //                 ),
    //                 SizedBox(
    //                   width: 4,
    //                 ),
    //                 Text(
    //                   'Demak, Indonesia',
    //                   style: TextStyleConstant.p1.copyWith(
    //                     color: ColorConstant.black,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           CircleAvatar(
    //             child: Image.asset('assets/images/person.png'),
    //           )
    //         ],
    //       ),
    //       SizedBox(
    //         height: 32,
    //       ),
    //       CarouselSlider(
    //         options: CarouselOptions(height: 150),
    //         items: imgList.map((i) {
    //           return Builder(
    //             builder: (BuildContext context) {
    //               return Container(
    //                 width: MediaQuery.of(context).size.width,
    //                 margin: EdgeInsets.all(12),
    //                 decoration: BoxDecoration(
    //                   color: ColorConstant.red2,
    //                   borderRadius: BorderRadius.circular(
    //                     12,
    //                   ),
    //                 ),
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(
    //                     12,
    //                   ),
    //                   child: Image.asset(
    //                     i,
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //               );
    //             },
    //           );
    //         }).toList(),
    //       ),
    //       // Row(
    //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //   children: [
    //       //     const Text(
    //       //       'List Restaurant',
    //       //       style: TextStyle(
    //       //         fontSize: 24,
    //       //         fontWeight: FontWeight.bold,
    //       //       ),
    //       //     ),
    //       //     IconButton(
    //       //       onPressed: () {
    //       //         context.push(AddRestaurantPage.routeName);
    //       //       },
    //       //       icon: const Icon(
    //       //         Icons.add_circle_outline_rounded,
    //       //         color: Colors.blue,
    //       //         size: 32,
    //       //       ),
    //       //     ),
    //       //   ],
    //       // ),

    //       Row(
    //         children: [
    //           Text('Popular Restaurant', style: TextStyleConstant.h4),
    //           const Spacer(),
    //           TextButton(
    //             onPressed: () {
    //               // context.push(AddRestaurantPage.routeName);
    //             },
    //             child: Text('See All >-',
    //                 style: TextStyleConstant.p1
    //                     .copyWith(color: ColorConstant.red2)),
    //           ),
    //         ],
    //       ),
    //       const SizedBox(
    //         height: 12,
    //       ),
    //       Expanded(
    //         child: BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
    //           builder: (context, state) {
    //             return state.maybeWhen(
    //               orElse: () => const Center(
    //                 child: CircularProgressIndicator(),
    //               ),
    //               loaded: (model) {
    //                 return ScrollConfiguration(
    //                   behavior:
    //                       const ScrollBehavior().copyWith(overscroll: false),
    //                   child: GridView.builder(
    //                       physics: NeverScrollableScrollPhysics(),
    //                       itemCount: model.data.length,
    //                       gridDelegate:
    //                           const SliverGridDelegateWithMaxCrossAxisExtent(
    //                         maxCrossAxisExtent: 200,
    //                         childAspectRatio: 9 / 10,
    //                         crossAxisSpacing: 20,
    //                         mainAxisSpacing: 20,
    //                       ),
    //                       itemBuilder: (context, index) {
    //                         return CardRestaurantWidget(
    //                           restaurant: model.data[index],
    //                         );
    //                       }),
    //                 );
    //               },
    //               error: (message) {
    //                 return Text(message.error.message);
    //               },
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
