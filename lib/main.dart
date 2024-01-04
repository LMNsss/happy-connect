
import 'package:flutter/material.dart';
import 'package:happy_connect/UI/login.dart';
void main(List<String> args) {
  runApp(const HappyConnect());
}

class HappyConnect extends StatefulWidget {
  const HappyConnect({super.key});

  @override
  State<HappyConnect> createState() => Login();
}

