import 'package:flutter/material.dart';
import 'package:happy_connect/core/Models/user_model.dart';
import 'package:happy_connect/core/view/login.dart';

import '../services/auth_services.dart';


class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}


