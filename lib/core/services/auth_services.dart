import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/token_model.dart';
import '../Models/user_model.dart';
import '../utils/api_endpoints.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AuthService {
  final Dio _dio = Dio()..interceptors.add(PrettyDioLogger());

  static const String accessTokenKey = 'access_token';

  Future<String> login(String username, String password) async {
    try {
      final response = await _dio.post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login,
        data: {
          'username': username,
          'password': password,
          'grant_type': 'password',
          'refresh_token': 'string'
        },
      );

      if (response.statusCode == 200 &&
          response.data['data']['access_token'] != '') {
        print('Success!!');
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
    try {
      // Giả sử getToken() trả về một String hoặc null
      String? token = getToken() as String?;
      if (token == '') {
        // Token không tồn tại, có thể là người dùng chưa đăng nhập
        return null;
      }
      Map<String, dynamic> decodedToken = Jwt.parseJwt(token!);
      String userName = decodedToken['preferred_username'];
      String email = decodedToken['email'];
      // Tạo một đối tượng UserModel từ thông tin người dùng
      UserModel user = UserModel(userName: userName, email: email);
      // Trả về thông tin người dùng
      return user;
    } catch (e) {
      // Xử lý lỗi nếu có
      print("Error getting user profile: $e");
      return null;
    }
  }
}
