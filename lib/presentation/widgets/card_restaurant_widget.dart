// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_restaurant/data/models/response/restaurants_response_model.dart';
import 'package:flutter_restaurant/presentation/pages/detail_restaurant_page.dart';
import 'package:go_router/go_router.dart';

class CardRestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const CardRestaurantWidget({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('${DetailRestaurantPage.routeName}/${restaurant.id}');
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueGrey[50],
        ),
        width: MediaQuery.of(context).size.width * 0.4,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                child: Image.network(restaurant.attributes.photo == null
                    ? 'https://i.redd.it/mn9c32es4zi21.png'
                    : restaurant.attributes.photo!),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                restaurant.attributes.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                restaurant.attributes.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
