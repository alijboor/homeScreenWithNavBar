import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/enums/e_layout_type.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/models/product.dart';
import 'package:home_screen/views/category_product/screens/product_detail_screen.dart';

class ProductListView extends StatelessWidget {
  const ProductListView(
      {super.key,
      required this.products,
      this.layout = ELayout.row,
      this.addToCart});
  const ProductListView.column(
      {super.key,
      required this.products,
      required this.addToCart,
      this.layout = ELayout.column});

  final List<Product> products;
  final ELayout layout;
  final ValueChanged<Product>? addToCart;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection:
            layout == ELayout.row ? Axis.horizontal : Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            _itemBuilder(context, products.elementAt(index)),
        separatorBuilder: (_, index) => const Gap.h(20),
        itemCount: products.length);
  }

  Widget _itemBuilder(BuildContext context, Product item) {
    var child = layout == ELayout.row ? _buildRow(item) : _buildColumn(item);

    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ProductDetailsScreen(item)));
        },
        child: child);
  }

  Widget _buildColumn(Product item) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 3.5,
      shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: SizedBox(
            height: 120, child: Image.network(item.image, fit: BoxFit.fill)),
        title: CustomText(
            text: item.name,
            color: Colors.black,
            overflow: TextOverflow.visible),
        subtitle: Row(
          children: [
            CustomText(
                text: '${item.currency}${item.amount}',
                color: Colors.deepPurpleAccent),
            const Spacer(),
            IconButton(
                onPressed: () => addToCart?.call(item),
                icon: const Icon(
                  Icons.add_shopping_cart_rounded,
                  color: Colors.deepPurpleAccent,
                  size: 18,
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildRow(Product item) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              height: 90, child: Image.network(item.image, fit: BoxFit.fill))),
      CustomText(
          text: item.name, color: Colors.black, overflow: TextOverflow.visible),
      CustomText(
          text: '${item.currency}${item.amount}',
          color: Colors.deepPurpleAccent)
    ]);
  }
}