import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/token_model.dart';
import '../utils/api_endpoints.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<TokenModel?> login(String username, String password) async {
    try {
      final response = await _dio.post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login,
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200 && response.data.containsKey('token')) {
        TokenModel tokenModel = TokenModel.fromJson(response.data);
        await saveToken(tokenModel.token);
        return tokenModel;
      } else {
        return null;
      }
    } catch (error) {
      print('Error during login: $error');
      return null;
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

// Future<UserModel?> getUserProfile() async {
//   // Implement logic to fetch user profile based on the token
//   // ...
//
//   // For demonstration purposes, return a dummy user
//   return UserModel(id: '1', username: 'demo', email: 'demo@example.com');
// }
}
