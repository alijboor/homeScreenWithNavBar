import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/enums/e_layout_type.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/component/text_field_widget.dart';
import 'package:home_screen/features/home/widgets/special_list_view.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        children: [
          CustomText(
              text: LocaleKeys.category,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              size: 18),
          Gap.v(15.0),
          TextFiledWidget(
              hint: LocaleKeys.searchCategoryHint,
              prefixIcon: Icon(Icons.search, color: Colors.deepPurpleAccent)),
          CategoryListView(layout: ELayout.grid)
        ],
      ),
    );
  }
}