import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/constants.dart';
import 'package:http/http.dart' as http;

import '../models/response/restaurants_response_model.dart';

class RestaurantRemoteDataSource {
  Future<Either<String, RestaurantsResponseModel>> getAllRestaurant() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Constants.baseUrl}/api/restaurants',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      debugPrint(response.body);

      if (response.statusCode == 200) {
        return Right(
          RestaurantsResponseModel.fromJson(
            jsonDecode(
              response.body,
            ),
          ),
        );
      } else {
        return const Left('API ERROR');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
