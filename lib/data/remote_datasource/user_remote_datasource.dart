import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_restaurant/common/constants.dart';
import 'package:flutter_restaurant/data/local_datasource/auth_local_datasource.dart';
import 'package:flutter_restaurant/data/models/response/auth_response_model.dart';
import 'package:flutter_restaurant/data/models/response/error_response_model.dart';
import 'package:http/http.dart' as http;

class UserRemoteDataSource {
  Future<Either<ErrorResponseModel, User>> getUser(int idUser) async {
    final getToken = await AuthLocalDataSource().getToken();
    final response = await http.get(
      Uri.parse(
        '${Constants.baseUrl}/api/users/$idUser',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $getToken',
      },
    );
    print('Response Body getUserById:  ${response.body}');

    if (response.statusCode == 200) {
      return Right(
        User.fromJson(
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
}
