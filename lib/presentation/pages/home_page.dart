import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/presentation/pages/add_restaurant_page.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'List Restaurant',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.push(AddRestaurantPage.routeName);
                },
                icon: const Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.blue,
                  size: 32,
                ),
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
    );
  }
}
