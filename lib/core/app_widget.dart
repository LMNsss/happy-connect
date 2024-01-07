import 'package:flutter/material.dart';
import 'package:happy_connect/core/view/login.dart';
import 'package:happy_connect/core/view/sample_photo.dart';
import 'package:happy_connect/core/services/login_services.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LoginSwitchController.instance.themeSwitch,
      builder: (context, isDark, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: LoginService().getUser(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    strokeWidth: 3.0,
                  ),
                );
              case ConnectionState.none:
                return Login();
              default:
                if (snapshot.data != null) {
                  return SamplePhoto(user: snapshot.data);
                } else {
                  return Login();
                }
            }
          },
        ),
      
        routes: {
          '/login': (_) => Login(),
        },
      ),
    );
  }
}
