import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/constants.dart';
import 'package:http/http.dart' as http;

import '../models/response/add_restaurant_response_model.dart';
import '../models/response/error_response_model.dart';
import '../models/response/restaurants_response_model.dart';

class RestaurantRemoteDataSource {
  Future<Either<ErrorResponseModel, RestaurantsResponseModel>>
      getAllRestaurant() async {
    final response = await http.get(
      Uri.parse(
        '${Constants.baseUrl}/api/restaurants',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Right(
        RestaurantsResponseModel.fromJson(
          jsonDecode(
            response.body,
          ),
        ),
      );
    } else {
      return Left(
        ErrorResponseModel.fromJson(
          jsonDecode(
            response.body,
          ),
        ),
      );
    }
  }

  Future<Either<String, AddRestaurantResponseModel>> getByIdRestaurant(
      int idRestaurant) async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrl}/api/restaurants/$idRestaurant'));

    if (response.statusCode == 200) {
      return Right(
          AddRestaurantResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Error get Restauranty ByID');
    }
  }
}
