import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:happy_connect/core/Models/login_request.dart';
import 'package:happy_connect/core/services/api_service.dart';
import 'package:happy_connect/core/shared_pref/shared_pref_ext.dart';
import 'package:happy_connect/core/utils/api_endpoints.dart';
import 'package:happy_connect/core/view/Home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:happy_connect/core/components/text.dart';
import '../services/auth_services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final ApiService _apiService =
      ApiService(Dio(), baseUrl: ApiEndPoints.baseUrl);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
   if (kDebugMode) {
    username = 'ngoclm10';
    password = 'Lmn0812@';
   }
    final LoginRequest loginRequest = LoginRequest(
        username: username,
        password: password,
        grantType: 'password',
        refreshToken: 'string');

    var tokenModel = await _apiService
        .login(loginRequest)
        .then((value) => value.data.accessToken)
        .catchError((e) => '');

    // String tokenModel = await _authService.login(username, password);
    if (tokenModel.isNotEmpty) {
      var isSuccess = await _saveToken(tokenModel);
      print(tokenModel);
      if (isSuccess) {
        if (!mounted) return;
        _navigateToHomePage(context);
        print('object');
      }
    } else {
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
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
                        onPressed: _login,
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 15),
                    //   child: Center(
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         const Text(
                    //           'Bạn chưa có tài khoản?',
                    //           style: TextStyle(fontSize: 15),
                    //         ),
                    //         GestureDetector(
                    //           onTap: () {
                    //             _launchURL('https://example.com');
                    //           },
                    //           child: const Text(
                    //             'Đăng ký',
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               color: Colors.red,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     _launchURL('https://example.com');
                    //   },
                    //   child: const Text(
                    //     'Chính sách bảo mật và quyền riêng tư',
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _saveToken(String tokenModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isSuccess = await prefs.saveToken(tokenModel);
    return isSuccess;
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
