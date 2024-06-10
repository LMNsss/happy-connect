import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_connect/core/components/app_bar_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminManagement extends ConsumerStatefulWidget {
  final String title;

  const AdminManagement({super.key, required this.title});

  @override
  _AdminManagementState createState() => _AdminManagementState();
}

class _AdminManagementState extends ConsumerState<AdminManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppbar(context, widget.title),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: const Text(
              'Danh sách Admin',
              style: TextStyle(
                  color: Color(0xffEE0033),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(

          )
        ],
      ),
    );
  }
}
