
import 'package:flutter/material.dart';
import 'package:happy_connect/core/controllers/auth_controller.dart';
import 'package:happy_connect/core/view/login.dart';

class HappyConnect extends StatelessWidget {
  const HappyConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}

