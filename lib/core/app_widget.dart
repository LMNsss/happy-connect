import 'package:flutter/material.dart';
import 'package:happy_connect/core/controllers/auth_controller.dart';
import 'package:happy_connect/core/view/login.dart';
import 'package:happy_connect/core/view/sample_photo.dart';
import 'package:happy_connect/core/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HappyConnect extends StatefulWidget {
  State<HappyConnect> createState() => _HappyConnect();
}

class _HappyConnect extends State<HappyConnect> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Login()
      ),
    );
  }
}
