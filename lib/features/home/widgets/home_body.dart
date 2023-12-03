import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/component/main_screen.dart';
import 'product_list_view.dart';
import 'special_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap.v(10),
        _specialListView(context),
        const Gap.v(10),
        _featureListView,
        _bestSellingListView,
      ],
    );
  }

  Widget _headContainer(String title, {VoidCallback? onPress}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          size: 16,
        ),
        InkWell(
          onTap: onPress,
          child: const CustomText(
            text: LocaleKeys.seeMore,
            size: 16,
          ),
        )
      ],
    );
  }

  Widget _specialListView(BuildContext context) {
    return Column(
      children: [
        _headContainer(LocaleKeys.specialForYou,
            onPress: () => onCategorySeeMorePress(context)),
        const Gap.v(10),
        const SizedBox(height: 100, child: CategoryListView())
      ],
    );
  }

  void onCategorySeeMorePress(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const MainScreen(selectedIndex: 1)));
  }

  Widget get _featureListView {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headContainer(LocaleKeys.featureProducts),
        const Gap.v(10),
        const SizedBox(height: 150, child: ProductListView())
      ],
    );
  }

  Widget get _bestSellingListView {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap.v(10),
        _headContainer(LocaleKeys.featureProducts),
        const Gap.v(10),
        const SizedBox(height: 150, child: ProductListView())
      ],
    );
  }
}