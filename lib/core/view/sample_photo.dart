import 'package:flutter/material.dart';
import 'package:happy_connect/core/Models/user_model.dart';
import 'package:happy_connect/core/view/login.dart';

import '../services/auth_services.dart';


class SamplePhoto extends StatefulWidget {
  SamplePhoto({super.key});

  @override
  _SamplePhoto createState() => _SamplePhoto();
}

class _SamplePhoto extends State<SamplePhoto> {

  void _logout() {
    final AuthService _authService = AuthService();
    _authService.logout();
    print('token: ${_authService.getToken()}');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _logout,
              child: Text('Đăng xuất'),
            ),
          ],
        ),
      ),
    );
  }
}


