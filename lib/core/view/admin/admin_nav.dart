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
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          // Thêm khoảng cách giữa các hàng
                          mainAxisExtent: 120,
                        ),
                        itemCount: dataListItem.length,
                        itemBuilder: (context, index) {
                          final menuItem = dataListItem[index];
                          return Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              // color: Colors.blue,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(menuItem['icon'], ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    menuItem['title']!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}

List<Map<String, dynamic>> dataListItem = [
  {
    'icon':PhosphorIcons.userCircleGear(),
    'title': 'Quản lý Admin',
    'router': 'admin_nav'
  },
  {
    'icon': PhosphorIcons.image(),
    'title': 'Duyệt ảnh mẫu',
    'router': 'admin_nav'
  },
  {
    'icon': PhosphorIcons.listDashes(),
    'title': 'Danh sách nhân viên Onsite',
    'router': 'admin_nav'
  },
  {
    'icon': PhosphorIcons.userList(),
    'title': 'Lịch sử chấm công nhân viên',
    'router': 'admin_nav'
  },
  {
    'icon': PhosphorIcons.warningCircle(),
    'title': 'Báo cáo số lượng User',
    'router': 'admin_nav'
  },
  {
    'icon': PhosphorIcons.warning(),
    'title': 'Báo cáo số lượng Requests',
    'router': 'login'
  },
];
