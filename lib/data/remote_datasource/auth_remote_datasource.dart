import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/data/models/request/login_request_model.dart';

import '../../common/constants.dart';
import '../models/request/register_request_model.dart';
import '../models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/response/error_response_model.dart';

class AuthRemoteDataSource {
  Future<Either<ErrorResponseModel, AuthResponseModel>> register(
      RegisterRequestModel registerData) async {
    final response = await http.post(
      Uri.parse('${Constants.baseUrl}/api/auth/local/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        registerData.toJson(),
      ),
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return Right(
        AuthResponseModel.fromJson(
          jsonDecode(
            response.body,
          ),
        ),
      );
    } else {
      return Left(ErrorResponseModel.fromJson(jsonDecode(response.body)));
    }
  }

  Future<Either<ErrorResponseModel, AuthResponseModel>> login(
      LoginRequestModel model) async {
    final response = await http.post(
      Uri.parse('${Constants.baseUrl}/api/auth/local'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        model.toJson(),
      ),
    );
    if (response.statusCode == 200) {
      return Right(
        AuthResponseModel.fromJson(
          jsonDecode(
            response.body,
          ),
        ),
      );
    } else {
      return Left(ErrorResponseModel.fromJson(jsonDecode(response.body)));
    }
  }
}
