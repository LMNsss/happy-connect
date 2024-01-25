import 'package:flutter/material.dart';
import 'package:happy_connect/core/Models/user_model.dart';
import 'package:happy_connect/core/view/login.dart';

import '../services/auth_services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2 / 5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/1-background 2 1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
