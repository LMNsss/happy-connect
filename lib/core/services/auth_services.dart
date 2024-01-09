import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/token_model.dart';
import '../Models/user_model.dart';
import '../utils/api_endpoints.dart';

class AuthService {
  final Dio _dio = Dio();

  static const String accessTokenKey = 'access_token';

  Future<String> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.login}',
        data: {
          'username': username,
          'password': password,
          'grant_type': 'password',
          'refresh_token': 'string'
        },
      );

      if (response.statusCode == 200) {
        print('Success!!');
        // final tokenModel = TokenModel.fromJson(response.data);
        // await saveToken(tokenModel.token);
        await saveToken(response.data['data']['access_token']);
        return response.data['data']['access_token'];
      } else {
        // Handle unexpected response or status code
        print('Unexpected response during login: ${response.data}');
        return '';
      }
    } catch (error) {
      // Handle Dio errors or other unexpected errors
      print('Error during login: $error');
      return '';
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(accessTokenKey);
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessTokenKey, token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessTokenKey);
  }

  Future<UserModel?> getUserProfile() async {
    // Implement logic to fetch user profile based on the token
    // ...

    // For demonstration purposes, return a dummy user
    return UserModel(username: 'demo', email: 'demo@example.com');
  }
}
