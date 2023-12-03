import 'package:flutter/material.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/component/text_field_widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

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
        _icon(Icons.local_grocery_store_outlined),
        _icon(Icons.notifications)
      ],
    );
  }

  Widget _icon(IconData? icon) {
    return Card(
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
    );
  }
}