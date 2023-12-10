import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/enums/e_layout_type.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/component/search_text_field.dart';
import 'package:home_screen/controllers/products/products_controller.dart';
import 'package:home_screen/views/home/widgets/product_list_view.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key}) : _controller = ProductsController();
  final ProductsController _controller;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    widget._controller.setStateNotifier(() {
      setState(() {});
    });

    widget._controller.onSearch('');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CustomText(
              text: LocaleKeys.search,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              size: 18),
          const Gap.v(15.0),
          ProductSearchField(onChanged: widget._controller.onSearch),
          ProductListView(
            layout: ELayout.column,
            addToCart: widget._controller.addToCart,
            products: widget._controller.searchList,
          )
        ],
      ),
    );
  }
}