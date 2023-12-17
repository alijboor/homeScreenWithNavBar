import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/custom_appbar.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/views/language/language_list_view.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(screenTitle: LocaleKeys.language),
      body: const Column(
        children: [
          Center(child: CustomText(text: LocaleKeys.selectLanguage)),
          Gap(height: 8.0),
          LanguageListView()
        ],
      ),
    );
  }
}