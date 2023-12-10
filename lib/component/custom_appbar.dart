import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/gap.dart';

class CustomAppBar extends AppBar implements PreferredSizeWidget {
  final String screenTitle;
  final Widget? suffixIcon;
  CustomAppBar({this.screenTitle = '', this.suffixIcon, super.key})
      : super(
            titleSpacing: 0.0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            shadowColor: Colors.transparent,
            leading: const BackButton(color: Colors.black),
            actions: [suffixIcon ?? const Gap(height: 0.0)],
            centerTitle: true,
            title: CustomText(
                text: screenTitle,
                size: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black));
}