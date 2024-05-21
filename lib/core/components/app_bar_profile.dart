import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:go_router/go_router.dart';

AppBar ProfileAppbar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: const Color(0xffEE0033),
    elevation: 0.0,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Icon(
        PhosphorIcons.caretLeft(),
        color: Colors.white,
        size: 30,
        weight: 20,
      ),
    ),
  );
}
