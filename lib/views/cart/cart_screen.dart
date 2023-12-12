import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/custom_appbar.dart';
import 'package:home_screen/component/custom_button.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/controllers/products/products_controller.dart';
import 'package:home_screen/models/cart_product.dart';
import 'package:home_screen/models/product.dart';
import 'package:home_screen/views/cart/check_out_screen.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key}) : _controller = ProductsController();
  final ProductsController _controller;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    widget._controller.setStateNotifier(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        screenTitle: LocaleKeys.myCards,
      ),
      body: Column(
        children: [
          Center(
              child: CustomText(
                  text:
                      '${widget._controller.cartList.length} ${LocaleKeys.products}')),
          _itemsView
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const CustomText(text: LocaleKeys.total),
                  const Spacer(),
                  CustomText(
                      text: widget._controller.totalCartProducts,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),
            const Gap.h(15),
            Expanded(
              child: CustomButton(
                text: LocaleKeys.checkOut,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CheckOutScreen(widget._controller)));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _itemsView => Expanded(
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, index) =>
                _itemBuilder(widget._controller.cartList.elementAt(index)),
            separatorBuilder: (_, index) => const Gap.h(20),
            itemCount: widget._controller.cartList.length),
      );

  Widget _itemBuilder(CartProduct item) {
    Product product = item.product;
    return Card(
      shadowColor: Colors.grey,
      elevation: 3.5,
      shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: SizedBox(
                  height: 120,
                  child: Image.network(product.image, fit: BoxFit.fill)),
              title: CustomText(
                  text: product.name,
                  color: Colors.black,
                  overflow: TextOverflow.visible),
              subtitle: CustomText(
                  text: '${product.currency}${product.amount}',
                  color: Colors.deepPurpleAccent),
            ),
          ),
          Column(
            children: [
              IconButton(
                  icon: const Icon(Icons.add, size: 15),
                  onPressed: () => widget._controller.onQuantityAdd(item)),
              CustomText(text: item.quantity.toString()),
              item.quantity != 0
                  ? IconButton(
                      icon: const Icon(Icons.remove, size: 15),
                      onPressed: () =>
                          widget._controller.onQuantityDecrease(item))
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}