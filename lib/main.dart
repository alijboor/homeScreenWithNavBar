import 'package:flutter/material.dart';
import 'package:home_screen/component/main_screen.dart';
import 'package:home_screen/features/home/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALi Jboor Test',
      home: MainScreen(),
    );
  }

}