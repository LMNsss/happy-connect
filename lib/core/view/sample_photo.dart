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
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/NavigationBar.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(

                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/12),
                      child: const Text(
                        'Happy Connect',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
