import 'package:flutter/material.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/component/text_field_widget.dart';
import 'package:home_screen/controllers/home/home_controller.dart';
import 'package:home_screen/views/cart/cart_screen.dart';
import 'package:home_screen/views/notifications/notifications_screen.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key}) : _controller = HomeController();

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextFiledWidget(
            hint: LocaleKeys.searchProductHint,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
        _icon(Icons.local_grocery_store_outlined, onPress: () => _controller.onPress(context, CartScreen())),
        _icon(Icons.notifications,
            onPress: () => _controller.onPress(context, const NotificationsScreen()))
      ],
    );
  }

  Widget _icon(IconData? icon, {VoidCallback? onPress}) {
    return InkWell(
      onTap: () => onPress?.call(),
      child: Card(
        shadowColor: Colors.grey,
        elevation: 3.5,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(180)),
        child: SizedBox(
          width: 50,
          height: 50,
          child: Icon(
            icon,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}