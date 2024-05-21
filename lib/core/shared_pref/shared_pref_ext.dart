import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String token = 'token';
const String email = 'email';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

extension SharedPref on SharedPreferences {
  Future<bool> saveToken(String accessToken) {
    return setString(token, accessToken);
  }

  String? getToken() {
    return getString(token);
  }

  bool isLogin() {
    return getString(token)?.isNotEmpty ?? false;
  }

  Future<bool> saveEmail(String emailUser){
    return setString(email, emailUser);
  }

  String? getEmail(){
    return getString(email);
  }
}
