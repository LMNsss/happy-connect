import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_connect/core/shared_pref/shared_pref_ext.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/user_response.dart';
import '../../services/api_service.dart';
import '../../utils/api_endpoints.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(Dio(), baseUrl: ApiEndPoints.baseUrl),
);

class ItemColorsNotifier extends StateNotifier<List<Color>> {
  ItemColorsNotifier()
      : super(List.filled(
            10, const Color(0xFF475467))); // Adjust the length as needed

  void updateColor(int index, Color color) {
    state = [...state]..[index] = color;
  }
}

class BackgroundItemColorsNotifier extends StateNotifier<List<Color>> {
  BackgroundItemColorsNotifier()
      : super(List.filled(10, Colors.white)); // Adjust the length as needed

  void updateColor(int index, Color color) {
    state = [...state]..[index] = color;
  }
}
Future<void> clearSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

final getInfoUserProvider = FutureProvider<UserResponse>((ref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getToken();
  final apiService = ref.watch(apiServiceProvider);
  try {
    final infoUser = await apiService.getStaffByEmail('Bearer $token');
    return infoUser;
  } catch (e) {
    print('Error while logging in: $e');
    return UserResponse(
      code: "error",
      message: "Error while logging in",
      data: Data(
        id: 0,
        fullname: "",
        email: "",
        role: 0,
        onsite: false,
        numberOfPendingImage: 0,
        numberOfImage: 0,
        sendMail: false,
        groupId: null,
        key: null,
        hasImagebase: false,
        admin: false,
      ),
    );
  }
});

class Profile extends ConsumerWidget {
  Profile({super.key});

  List<Color> itemColors =
      List.generate(dataListItem.length, (index) => const Color(0xFF475467));
  List<Color> backgroundItemColors =
      List.generate(dataListItem.length, (index) => Colors.white);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final userResponse = ref.watch(getInfoUserProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2 / 5,
              decoration: const BoxDecoration(
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
                          top: MediaQuery.of(context).size.height * 1 / 18),
                      child: const Text(
                        'Tài khoản',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 1 / 16),
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/avatar-user.png',
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 1 / 25),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(51, 255, 255, 255),
                      ),
                      child: Column(
                        children: [
                          userResponse.when(
                            data: (user) => Text(
                              user.data.email ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            loading: () => const CircularProgressIndicator(),
                            error: (err, stack) => const Text(
                              'Error loading user info',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          userResponse.when(
                            data: (user) => Text(
                              user.data.fullname ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            loading: () => const CircularProgressIndicator(),
                            error: (err, stack) => const Text(
                              'Error loading user info',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: screenHeight * 0.45,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(),
                itemCount: dataListItem.length,
                itemBuilder: (context, index) {
                  final menuItem = dataListItem[index];
                  return GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   print(menuItem['title']);
                      //   itemColors[index] = const Color(0xFFEE0033);
                      //   backgroundItemColors[index] = const Color(0xFFFFE9ED);
                      // });
                      // Timer(const Duration(milliseconds: 300), () {
                      //   setState(() {
                      //     itemColors[index] = const Color(0xFF475467);
                      //     backgroundItemColors[index] = Colors.white;
                      //   });
                      // });
                      String title = menuItem['title'];
                      if (menuItem['title'] == 'Đăng xuất') {
                        context.go('/${menuItem['router']}');
                        clearSharedPreferences();
                      } else {
                        context.push("/${menuItem['router']}/$title");
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: backgroundItemColors[index],
                      ),
                      child: ListTile(
                        leading: Icon(
                          menuItem['icon'],
                          color: itemColors[index],
                        ),
                        title: Text(
                          menuItem['title'],
                          style: TextStyle(
                            color: itemColors[index],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> dataListItem = [
  {
    'icon': PhosphorIcons.userCircleGear(),
    'title': 'Admin',
    'router': 'admin_nav'
  },
  {
    'icon': PhosphorIcons.userCircleGear(),
    'title': 'Lịch sử chấm công',
    'router': 'admin_nav'
  },
  {'icon': PhosphorIcons.usersThree(), 'title': 'Nhóm', 'router': 'admin_nav'},
  {
    'icon': PhosphorIcons.userCircleMinus(),
    'title': 'Xoá Tài khoản',
    'router': 'admin_nav'
  },
  {
    'icon': PhosphorIcons.star(),
    'title': 'Đánh giá ứng dụng',
    'router': 'admin_nav'
  },
  {'icon': PhosphorIcons.signOut(), 'title': 'Đăng xuất', 'router': 'login'},
];
