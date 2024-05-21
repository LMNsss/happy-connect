import 'package:flutter/material.dart';
import 'package:happy_connect/core/Router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main(List<String> args) {
  final appRouter = AppRouter();
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.router,
      ),
    ),
  );
}
