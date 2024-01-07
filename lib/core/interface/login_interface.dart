import 'package:flutter/cupertino.dart';
import'package:happy_connect/core/Models/user_model.dart';
import'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class ILogin {
  Future<UserModel?> login(String user_name, String password) async {
    final api = 'https://checkin2.viettel-softwareservices.vn:9091/api/v1/login';
    final data = {"username": user_name, "password": password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return UserModel(username: AutofillHints.username, token: body['token']);
    } else {
      return null;
    }
  }

  Future<UserModel?> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final user_name = storage.getString('USERNAME');
    if (token != null && user_name != null) {
      return UserModel(username: user_name, token: token);
    } else {
      return null;
    }
  }

  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return true;
  }
}