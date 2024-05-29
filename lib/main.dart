import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:happy_connect/core/Router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<CameraDescription> cameras = [];
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
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
