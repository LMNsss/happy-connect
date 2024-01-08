
import '../Models/token_model.dart';
import '../services/auth_services.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<String?> login(String username, String password) async {
    TokenModel? tokenModel = await _authService.login(username, password);
    return tokenModel?.token;
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}