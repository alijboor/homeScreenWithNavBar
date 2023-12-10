import 'package:flutter/material.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/views/home/widgets/home_app_bar.dart';
import 'package:home_screen/views/home/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap.v(50.0),
              HomeAppBar(),
              const Gap.v(12.0),
              HomeBody()
            ],
          ),
        ));
  }
}