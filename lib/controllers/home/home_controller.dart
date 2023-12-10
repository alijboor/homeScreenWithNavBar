import 'package:flutter/material.dart';

class HomeController {
  void onPress(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}