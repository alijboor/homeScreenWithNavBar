import 'package:flutter/material.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/views/address/address_screen.dart';
import 'package:home_screen/views/cards/cards_screen.dart';
import 'package:home_screen/views/language/language_screen.dart';

class UserProfileController {
  final Map<String, dynamic> services = {
    LocaleKeys.myAccount: {
      'icon': Icons.person_3_rounded,
      'screen': Container()
    },
    LocaleKeys.myOrders: {
      'icon': Icons.shopping_bag_outlined,
      'screen': Container()
    },
    LocaleKeys.languageSettings: {
      'icon': Icons.language_outlined,
      'screen': const LanguageScreen()
    },
    LocaleKeys.shippingAddrese: {
      'icon': Icons.edit_location,
      'screen': const ShippingAddressScreen()
    },
    LocaleKeys.myCards: {
      'icon': Icons.credit_card_sharp,
      'screen': const CardsScreen()
    },
    LocaleKeys.settings: {'icon': Icons.settings, 'screen': Container()},
    LocaleKeys.privacyPolicy: {
      'icon': Icons.privacy_tip_outlined,
      'screen': Container()
    },
    LocaleKeys.fqa: {
      'icon': Icons.question_mark_rounded,
      'screen': Container()
    },
  };
}