import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/custom_appbar.dart';
import 'package:home_screen/component/local_keys.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        screenTitle: LocaleKeys.myCards,
        suffixIcon: _addCardIcon,
      ),
      body: const Column(
        children: [
          Center(child: CustomText(text: LocaleKeys.yourPaymentCards)),
        ],
      ),
    );
  }

  Widget get _addCardIcon {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add,
          color: Colors.black,
        ));
  }
}