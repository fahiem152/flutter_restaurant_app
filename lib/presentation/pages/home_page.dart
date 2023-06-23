import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_restaurant/presentation/widgets/card_restaurant_widget.dart';

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
    return BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (model) {
            return GridView.builder(
                itemCount: model.data.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 9 / 10,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return CardRestaurantWidget(
                    imageUrl: model.data[index].attributes.photo,
                    nameRestaurant: model.data[index].attributes.name,
                    descbRestaurant: model.data[index].attributes.description,
                  );
                });
          },
          error: (message) {
            return Text(message.error.message);
          },
        );
      },
    );
  }
}
