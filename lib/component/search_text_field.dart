import 'package:flutter/material.dart';
import 'package:home_screen/component/local_keys.dart';

import 'text_field_widget.dart';

class ProductSearchField extends StatelessWidget {
  const ProductSearchField({super.key, this.onChanged});
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFiledWidget(
        hint: LocaleKeys.searchCategoryHint,
        onChanged: onChanged,
        prefixIcon: const Icon(Icons.search, color: Colors.deepPurpleAccent));
  }
}