import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/response/auth_response_model.dart';

class AuthLocalDataSource {
  Future<bool> saveAuthData(AuthResponseModel model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString('auth', jsonEncode(model.toJson()));
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(
      jsonDecode(
        authJson,
      ),
    );
    return authData.jwt;
  }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';

    return authJson.isNotEmpty;
  }
}
