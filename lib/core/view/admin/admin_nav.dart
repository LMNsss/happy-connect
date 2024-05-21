import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_connect/core/view/Home/profile.dart';
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
                  height: 200,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                    ),

                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 10,
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(PhosphorIcons.userCircleGear()),
                            Container(
                              width: 150,
                              child: const Text(
                                'Danh sách nhân viên onsite',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
