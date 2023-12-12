import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/custom_appbar.dart';
import 'package:home_screen/component/custom_button.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/component/main_screen.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          screenTitle: LocaleKeys.paymnet,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                    backgroundColor: Colors.indigoAccent,
                    child: Icon(Icons.done, color: Colors.white)),
                const Gap(height: 20),
                const CustomText(
                  text: LocaleKeys.paymnetSuccess,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  size: 16,
                ),
                const Gap(height: 20),
                const CustomText(
                  text: LocaleKeys.successMsg,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  size: 16,
                ),
                const Gap(height: 30),
                CustomButton(
                  text: LocaleKeys.continueShopping,
                  onPress: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const MainScreen()));
                  },
                )
              ],
            ),
          ),
        ));
  }
}