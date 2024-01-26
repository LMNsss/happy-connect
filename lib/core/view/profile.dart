import 'package:flutter/material.dart';
import 'package:happy_connect/core/Models/user_model.dart';
import 'package:happy_connect/core/components/text.dart';
import 'package:happy_connect/core/view/login.dart';

import '../services/auth_services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  late UserModel _user;

  @override
  void initState() {
    super.initState();
    _initUserProfile();
  }

  Future<void> _initUserProfile() async {
    AuthService authService = AuthService();
    UserModel? user = await authService.getUserProfile();
    print(user.toString());
    if (user != null) {
      setState(() {
        _user = user;
      });
    } else {
      // Xử lý trường hợp không thể lấy thông tin người dùng
    }
  }

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
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 1 / 20),
                      child: SingleTextWidget(
                          text: 'Tài khoản',
                          textColor: Colors.white,
                          textSize: 20,
                          textWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 1 / 20),
                      child: ClipOval(
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq-uolODmp69iK_6HwDJR1y1kkUgo-QaRcfecLlw0TsA&s',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 1 / 25),
                      width: MediaQuery.of(context).size.width * 1 / 2,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(51, 255, 255, 255)),
                      child: Column(
                        children: [
                          SingleTextWidget(
                              text: _user.userName,
                              textColor: Colors.white,
                              textSize: 20,
                              textWeight: FontWeight.bold),
                          SingleTextWidget(
                              text: _user.email,
                              textColor: Colors.white,
                              textSize: 20,
                              textWeight: FontWeight.normal)
                        ],
                      ),
                    )
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
