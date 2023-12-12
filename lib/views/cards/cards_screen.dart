import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/custom_appbar.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/views/cards/card_view.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        screenTitle: LocaleKeys.myCards,
        suffixIcon: _addCardIcon,
      ),
      body: Column(
        children: [
          const Center(child: CustomText(text: LocaleKeys.yourPaymentCards)),
          const Gap(height: 8.0),
          CardView()
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