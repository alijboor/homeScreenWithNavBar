import 'package:flutter/cupertino.dart';
import 'package:home_screen/models/address/address_info_entity.dart';

class AddressController {
  bool isLoading = false;
  List<AddressInfoEntity> addresses = [];

  VoidCallback? _parentNotifier;


  void setStateNotifier(VoidCallback? notifier) {
    _parentNotifier = notifier;
  }

  void notify() {
    _parentNotifier?.call();
  }


  Future<void> getAllAddresses() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    addresses.add(AddressInfoEntity(
        phoneNumber: '+972569206043',
        country: 'PAL',
        city: 'Hebron',
        firstName: 'Ali',
        lastName: 'Jboor',
        street: 'Abd Alqader Alhusainin St.',
        postalCode: 'PS8741684'));
    isLoading = false;
    notify();
  }
}