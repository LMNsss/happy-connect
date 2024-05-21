import 'package:flutter/material.dart';
import 'package:happy_connect/core/shared_pref/shared_pref_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  void checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLoggedIn = sharedPreferences.isLogin();
    Future.delayed(Duration.zero, () {
      if (isLoggedIn) {
        context.go('/home');
      } else {
        context.go('/login');
      }
    });
  }
}
