import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_connect/core/Models/admin_response.dart';
import 'package:happy_connect/core/Models/login_request.dart';
import 'package:happy_connect/core/components/app_bar_profile.dart';
import 'package:happy_connect/core/services/api_service.dart';
import 'package:happy_connect/core/shared_pref/shared_pref_ext.dart';
import 'package:happy_connect/core/utils/api_endpoints.dart';
import 'package:happy_connect/core/view/Home/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:happy_connect/core/components/text.dart';

final apiServiceProvider = Provider<ApiService>(
    (ref) => ApiService(Dio(), baseUrl: ApiEndPoints.baseUrl));

class AdminManagement extends ConsumerWidget {
  final String title;

  const AdminManagement({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Future<List<AdminResponse>> getAdmin() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final apiService = ref.read(apiServiceProvider);

      try {
        final String token = prefs.getString('token') ?? '';
        final adminList = await apiService.getStaffByEmail('Bearer $token');

        if (adminList.code == "200") {
          final List<dynamic> jsonList = adminList.data as List<dynamic>;
          final List<AdminResponse> result = jsonList.map((e) => AdminResponse.fromJson(e as Map<String, dynamic>)).toList();
          return result;
        } else {
          throw Exception('Failed to fetch admin data: ${adminList.code}');
        }
      } catch (e) {
        print('Error fetching admin data: $e');
        throw Exception('Failed to fetch admin data.');
      }
    }
    return Scaffold(
      appBar: ProfileAppbar(context, title),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Danh sách Admin',
              style: TextStyle(
                  color: Color(0xffEE0033),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(getAdmin().toString())
        ],
      ),
    );
  }
}
