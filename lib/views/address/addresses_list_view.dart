import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/loading_widget.dart';
import 'package:home_screen/controllers/address/address_controller.dart';
import 'package:home_screen/models/address/address_info_entity.dart';

class AddressesListView extends StatefulWidget {
  AddressesListView({super.key}) : _controller = AddressController();

  final AddressController _controller;
  @override
  State<AddressesListView> createState() => _AddressesListViewState();
}

class _AddressesListViewState extends State<AddressesListView> {
  AddressController get controller => widget._controller;

  int selected = 0;
  @override
  void initState() {
    controller.setStateNotifier(() {
      setState(() {});
    });

    controller.getAllAddresses();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return controller.isLoading
        ? const LoadingWidget()
        : SingleChildScrollView(
            child: Column(
              children: List.generate(
                  controller.addresses.length,
                  (index) => InkWell(
                        onTap: () {
                          selected = index;
                          setState(() {});
                        },
                        child: Card(
                            shadowColor: Colors.grey.withOpacity(0.45),
                            elevation: 2.5,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2.0,
                                  color: selected == index
                                      ? Colors.indigoAccent
                                      : Colors.transparent,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  12.0, 12.0, 12.0, 25.0),
                              child: addressView(controller.addresses[index]),
                            )),
                      )).toList(),
            ),
          );
  }

  Widget addressView(AddressInfoEntity element) {
    return ListTile(
      leading:
          const Icon(Icons.location_on_outlined, color: Colors.indigoAccent),
      title: CustomText(
          text:
              "${element.firstName} ${element.lastName}, ${element.phoneNumber}",
          color: Colors.black,
          fontWeight: FontWeight.bold),
      subtitle: CustomText(
          text: "${element.street}, ${element.city}, ${element.country}",
          fontWeight: FontWeight.w400),
    );
  }
}