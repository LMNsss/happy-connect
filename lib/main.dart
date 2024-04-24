import 'package:flutter/material.dart';
import 'package:happy_connect/core/view/splash_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main(List<String> args) {
  runApp(ProviderScope(
      child: MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (_) => const SplashScreen(),
    },
  )));
}
