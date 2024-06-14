import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_connect/core/Models/login_request.dart';
import 'package:happy_connect/core/services/api_service.dart';
import 'package:happy_connect/core/shared_pref/shared_pref_ext.dart';
import 'package:happy_connect/core/utils/api_endpoints.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:happy_connect/core/components/text.dart';

final apiServiceProvider = Provider<ApiService>(
    (ref) => ApiService(Dio(), baseUrl: ApiEndPoints.baseUrl));

class Login extends ConsumerWidget {
  Login({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<bool> _saveToken(String tokenModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isSuccess = await prefs.saveToken(tokenModel);
    return isSuccess;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Future<void> login(WidgetRef ref) async {
      // Extracting the username and password from the text controllers
      String username = _usernameController.text;
      String password = _passwordController.text;

      final loginRequest = LoginRequest(
          username: username,
          password: password,
          grantType: 'password'
      );

      // Accessing the ApiService instance
      final apiService = ref.read(apiServiceProvider);

      try {
        // Sending login request
        final tokenModel = await apiService.login(loginRequest);
        final accessToken = tokenModel.data.accessToken;
        // Check if access token is not empty
        if (accessToken.isNotEmpty) {
          // Save the access token
          bool isSuccess = await _saveToken(accessToken);
          if (isSuccess) {
            // Save the email of the user (if needed)
            // Navigate to the home page
            context.go('/home');
            print('Login successful');
            print('accessToken: $accessToken');
          } else {
            print('Failed to save the token');
          }
        } else {
          print('Login failed: Access token is empty');
        }
      } catch (e) {
        // Handling any errors that occur during the login process
        print('Error while logging in: $e');
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/1-background 2 1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: screenHeight / 2,
                  alignment: Alignment.center,
                  child: SingleTextWidget(
                    text: 'HAPPY CONNECT',
                    textColor: Colors.white,
                    textSize: 30,
                    textWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight / 2,
                padding: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Nhập thông tin chi tiết của bạn bên dưới.',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(top: 40),
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(100, 146, 146, 146),
                              width: 2.0,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(top: 20),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(100, 146, 146, 146),
                              width: 2.0,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {},
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 65,
                      margin: const EdgeInsets.only(top: 40.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () => login(ref),
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
