import 'package:flutter/material.dart';
import 'package:happy_connect/core/Models/user_model.dart';


class SamplePhoto extends StatefulWidget {
  final UserModel user;
  SamplePhoto({required this.user});
  @override
  _SamplePhoto createState() => _SamplePhoto();
}

class _SamplePhoto extends State<SamplePhoto> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.user.username),
          ],
        ),
      ),
    );
  }
}
