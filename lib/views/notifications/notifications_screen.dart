import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_appbar.dart';
import 'package:home_screen/component/local_keys.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        screenTitle: LocaleKeys.notifications,
      ),
    );
  }
}