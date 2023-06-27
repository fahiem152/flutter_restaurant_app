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
    final authJson = pref.getString('auth');
    if (authJson != null && authJson.isNotEmpty) {
      final authData = AuthResponseModel.fromJson(
        jsonDecode(authJson),
      );
      return authData.jwt;
    } else {
      return null; // atau tangani kasus lain yang sesuai
    }
  }

  // bool isValidToken(String token) {
  //   // Lakukan validasi token di sini
  //   // Misalnya, Anda dapat menggunakan library JWT decoding
  //   // atau mengirim permintaan ke server untuk memverifikasi token

  //   // Contoh validasi sederhana: Token tidak boleh kosong
  //   return token.isNotEmpty;
  // }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';

    if (authJson.isNotEmpty) {
      final authData = AuthResponseModel.fromJson(
        jsonDecode(authJson),
      );

      if (authData.jwt != null) {
        // Additional check for null token
        return true;
      }
    }

    return false;
  }
}
