import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_restaurant/common/constants.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../local_datasource/auth_local_datasource.dart';
import '../models/request/add_restaurant_request_model.dart';
import '../models/response/add_restaurant_response_model.dart';
import '../models/response/error_response_model.dart';
import '../models/response/restaurants_response_model.dart';
import '../models/response/upload_image_response_model.dart';

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
    print(response.body);

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

  Future<Either<ErrorResponseModel, RestaurantsResponseModel>>
      getRestaurantByUserId(int userId) async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}/api/restaurants?filters[userId]=$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Right(
        RestaurantsResponseModel.fromJson(
          jsonDecode(response.body),
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

  Future<Either<ErrorResponseModel, AddRestaurantResponseModel>>
      getByIdRestaurant(int idRestaurant) async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrl}/api/restaurants/$idRestaurant'));

    if (response.statusCode == 200) {
      return Right(
          AddRestaurantResponseModel.fromJson(jsonDecode(response.body)));
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

  Future<Either<ErrorResponseModel, UploadImageResponseModel>> uploadImage(
      XFile image) async {
    final getToken = await AuthLocalDataSource().getToken();
    debugPrint('token upload image: $getToken');
    final header = <String, String>{
      'Authorization': 'Bearer $getToken',
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${Constants.baseUrl}/api/upload'),
    );

    final bytes = await image.readAsBytes();
    final multiPartFile = http.MultipartFile.fromBytes(
      'files',
      bytes,
      filename: image.name,
    );

    request.files.add(multiPartFile);
    request.headers.addAll(header);
    http.StreamedResponse response = await request.send();
    final Uint8List responseList = await response.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);
    debugPrint('responseImage: ${response.statusCode}');
    debugPrint('responseImage: $responseData');

    if (response.statusCode == 200) {
      return Right(
        UploadImageResponseModel.fromJson(
          jsonDecode(responseData)[0],
        ),
      );
    } else {
      return Left(
        ErrorResponseModel.fromJson(
          jsonDecode(
            responseData,
          ),
        ),
      );
    }
  }

  Future<Either<ErrorResponseModel, AddRestaurantResponseModel>>
      createRestaurant(AddRestaurantRequestModel model) async {
    try {
      final getToken = await AuthLocalDataSource().getToken();
      debugPrint('token: $getToken');
      final response = await http.post(
        Uri.parse(
          '${Constants.baseUrl}/api/restaurants',
        ),
        body: jsonEncode(model),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $getToken',
        },
      );
      debugPrint('responseData: ${response.statusCode}');
      debugPrint('responseDataBody: ${response.body}');
      if (response.statusCode == 200) {
        return Right(AddRestaurantResponseModel.fromJson(
          jsonDecode(response.body),
        ));
      } else {
        return Left(ErrorResponseModel.fromJson(jsonDecode(response.body)));
      }
    } catch (e) {
      debugPrint('error creater: $e');
      throw Exception(e);
    }
  }
}
