import 'package:flutter/material.dart';
import 'package:happy_connect/core/shared_pref/shared_pref_ext.dart';
import 'package:happy_connect/core/view/Home/home.dart';
import 'package:happy_connect/core/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    checkLogin(context);
    return const Placeholder();
  }

  void checkLogin(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Future.delayed(
      Duration.zero,
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              sharedPreferences.isLogin() ? HomePage() : const Login(),
        ),
      ),
    );
  }
}
