import 'package:flutter/material.dart';
import 'package:happy_connect/core/components/app_bar_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckinHistory extends ConsumerStatefulWidget {
  final String title;

  const CheckinHistory({super.key, required this.title});

  @override
  _CheckinHistoryState createState() => _CheckinHistoryState();
}

class _CheckinHistoryState extends ConsumerState<CheckinHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppbar(context, widget.title),
    );
  }
}
