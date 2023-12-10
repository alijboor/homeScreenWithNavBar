import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/enums/e_layout_type.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/models/category.dart';

List<Category> categories = [
  Category("Computers",
      "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/page/category/desktop/dbcs-255750-aio-desktop-optiplex-7410-keyboard-mouse-km7321w-inspiron-27-7710-km5221w-800x620.png?fmt=png-alpha&wid=800&hei=620"),
  Category("Phones & Accessories",
      "https://miro.medium.com/v2/resize:fit:900/1*VG6TaD86OZU8Ng21te8N9A.jpeg"),
];

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, this.layout = ELayout.row});

  final ELayout layout;

  @override
  Widget build(BuildContext context) {
    Widget child = switch (layout) {
      ELayout.row => _rowLayout,
      ELayout.grid => _gridLayout,
      ELayout.column => const Gap.h(0.0)
    };

    return child;
  }

  Widget get _gridLayout => GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      children: categories.map(_itemBuilder).toList());

  Widget get _rowLayout => ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) => _itemBuilder(categories.elementAt(index)),
      separatorBuilder: (_, index) => const Gap.h(20),
      itemCount: categories.length);

  Widget _itemBuilder(Category item) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(item.imageUrl), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: item.name, fontWeight: FontWeight.w700, color: Colors.white)
        ],
      ),
    );
  }
}