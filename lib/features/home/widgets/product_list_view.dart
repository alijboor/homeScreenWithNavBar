import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/data/product.dart';
import 'package:home_screen/features/category_product/screens/product_detail_screen.dart';

List<Product> products = [
  Product("Bluetooth Printer",
      "https://m.media-amazon.com/images/I/6187SijTIYL.jpg", 50, '\$'),
  Product(
      "Macbook 22 Air",
      "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbook-air-midnight-select-20220606?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1653084303665",
      1548.18,
      '\$'),
  Product(
      "Iphone 14 ProMax",
      "https://www.bare-cases.com/cdn/shop/products/BareArmourCaseforiPhone14Proand14ProMax-MinimalistSlimShockProofMagSafeCaseforiPhone14Proand14ProMax-DeepPurple-iPhone14ProMax_2000x.jpg?v=1677189675",
      529.5,
      '\$'),
];

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            _itemBuilder(context, products.elementAt(index)),
        separatorBuilder: (_, index) => const Gap.h(20),
        itemCount: products.length);
  }

  Widget _itemBuilder(BuildContext context, Product item) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => ProductDetailsScreen(item)));
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 1), // changes position of shadow
              )
            ]),
            child: SizedBox(
                height: 90,
                child: Image.network(item.image, fit: BoxFit.fill))),
        CustomText(
            text: item.name,
            color: Colors.black,
            overflow: TextOverflow.visible),
        CustomText(
            text: '${item.currency}${item.amount}',
            color: Colors.deepPurpleAccent)
      ]),
    );
  }
}