// import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:happy_connect/core/Models/user_model.dart';
import 'package:happy_connect/core/interface/login_interface.dart';

class LoginService extends ILogin {
  @override
  Future<UserModel?> login(String user_name, String password) async {
    final api = Uri.parse('https://checkin2.viettel-softwareservices.vn:9091/api/v1/login');
    final data = {"username": user_name, "password": password};
    // final dio = Dio();
    http.Response response;
    response = await http.post(api, body: data);
    if (response.statusCode == 200) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      await storage.setString('TOKEN', body['token']);
      await storage.setString('USERNAME', user_name);
      return UserModel(username: user_name, token: body['token']);
    } else {
      return null;
    }
  }

  @override
  Future<UserModel?> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      return UserModel(username: email, token: token);
    } else {
      return null;
    }
  }

  @override
  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final username = storage.getString('USERNAME');
    final token = storage.getString('TOKEN');
    if (username != null && token != null) {
      await storage.remove('TOKEN');
      await storage.remove('USERNAME');
      return true;
    } else {
      return false;
    }
  }
}