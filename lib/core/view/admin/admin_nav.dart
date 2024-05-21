import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../components/app_bar_profile.dart';

class AdminNavigation extends ConsumerStatefulWidget {
  final String title;

  const AdminNavigation({super.key, required this.title});

  @override
  _AdminNavigationState createState() => _AdminNavigationState();
}

class _AdminNavigationState extends ConsumerState<AdminNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ProfileAppbar(context, widget.title),
        body: Center(
          child: Row(
            children: [
          Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                    shrinkWrap: true, // Make the GridView shrink to fit its children
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(PhosphorIcons.userCircleGear()),
                              Container(
                                child: const Text(
                                  'Danh sách nhân viên onsite',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
            ],
          ),
        ));
  }
}
