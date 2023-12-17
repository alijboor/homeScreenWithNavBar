import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/custom_appbar.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/views/address/addresses_list_view.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        screenTitle: LocaleKeys.shippingAddrese,
        suffixIcon: _addIcon,
      ),
      body: Column(
        children: [
          const Center(
              child: CustomText(text: LocaleKeys.yourShippingAddresses)),
          const Gap(height: 8.0),
          AddressesListView()
        ],
      ),
    );
  }

  Widget get _addIcon {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add,
          color: Colors.black,
        ));
  }
}