import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_connect/core/view/Home/home.dart';
import 'package:happy_connect/core/view/Home/profile.dart';
import 'package:happy_connect/core/view/Home/sample_photo.dart';
import 'package:happy_connect/core/view/User/checkin_history.dart';
import 'package:happy_connect/core/view/admin/admin_nav.dart';
import 'package:happy_connect/core/view/admin/admin_pages/admin_management.dart';
import 'package:happy_connect/core/view/login.dart';
import 'package:happy_connect/core/view/splash_screen.dart';

class AppRouter {
  final GoRouter _router;

  AppRouter()
      : _router = GoRouter(
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (BuildContext context, GoRouterState state) {
                return const SplashScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'login',
                  builder: (BuildContext context, GoRouterState state) {
                    return Login();
                  },
                ),
                GoRoute(
                  path: 'home',
                  builder: (BuildContext context, GoRouterState state) {
                    return HomePage();
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/profile',
              builder: (BuildContext context, GoRouterState state) {
                return Profile();
              },
            ),
            GoRoute(
              path: '/sample_photo',
              builder: (BuildContext context, GoRouterState state) {
                return const SamplePhoto();
              },
            ),
            GoRoute(
              path: '/admin_nav/:title',
              builder: (BuildContext context, GoRouterState state) {
                return AdminNavigation(title: state.pathParameters['title']!);
              },
            ),
            GoRoute(
              path: '/checkin_history/:title',
              builder: (BuildContext context, GoRouterState state) {
                return CheckinHistory(title: state.pathParameters['title']!);
              },
            ),
            GoRoute(
              path: '/admin_managerment/:title',
              builder: (BuildContext context, GoRouterState state) {
                return AdminManagement(title: state.pathParameters['title']!);
              },
            ),
          ],
        );

  GoRouter get router => _router;
}
