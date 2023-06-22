// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_restaurant/data/models/response/restaurants_response_model.dart';
import 'package:flutter_restaurant/presentation/pages/detail_restaurant_page.dart';
import 'package:go_router/go_router.dart';

class CardRestaurantWidget extends StatelessWidget {
  final String imageUrl;
  final String nameRestaurant;
  final String descbRestaurant;
  const CardRestaurantWidget({
    Key? key,
    required this.imageUrl,
    required this.nameRestaurant,
    required this.descbRestaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(DetailRestaurant.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueGrey[50],
        ),
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              child: Image.network(imageUrl),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              nameRestaurant,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              descbRestaurant,
              style: const TextStyle(
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
