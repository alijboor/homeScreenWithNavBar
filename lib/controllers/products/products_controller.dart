import 'package:flutter/material.dart';
import 'package:home_screen/models/cart_product.dart';
import 'package:home_screen/models/product.dart';

class ProductsController {
  static final ProductsController _manager = ProductsController._internal();

  ProductsController._internal();

  factory ProductsController() => _manager;

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
    Product(
        "Iphone 11 ProMax",
        "https://www.bare-cases.com/cdn/shop/products/BareArmourCaseforiPhone14Proand14ProMax-MinimalistSlimShockProofMagSafeCaseforiPhone14Proand14ProMax-DeepPurple-iPhone14ProMax_2000x.jpg?v=1677189675",
        280.5,
        '\$'),
    Product(
        "Macbook 21 Air",
        "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbook-air-midnight-select-20220606?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1653084303665",
        1130.99,
        '\$',
        isFavorite: true),
  ];

  List<Product> searchList = [];

  List<CartProduct> cartList = [];

  VoidCallback? _parentNotifier;

  double total = 0.0;

  void setStateNotifier(VoidCallback? notifier) {
    _parentNotifier = notifier;
  }

  void notify() {
    _parentNotifier?.call();
  }

  void onSearch(String? query) {
    query = query?.toLowerCase() ?? '';

    if (query.isEmpty) searchList = products;

    searchList = products
        .where((e) => e.searchInfo.any(
              (String value) => value.contains(query!),
            ))
        .toList();
    notify();
  }

  void addToCart(Product value) {
    CartProduct item = CartProduct(value);
    if (cartList.contains(item)) return;
    cartList.add(item);
    _calcTotal();
  }

  void _calcTotal() {
    total = 0.0;
    for (var e in cartList) {
      double amount = e.product.amount;
      if (e.quantity > 1) {
        amount = amount * e.quantity;
      }
      total += amount;
    }
    notify();
  }

  String get totalCartProducts {
    if (cartList.isEmpty) return '';
    return '${cartList.first.product.currency} ${total.floorToDouble()}';
  }

  void onQuantityAdd(CartProduct value) {
    ++value.quantity;
    _calcTotal();
  }

  void onQuantityDecrease(CartProduct value) {
    if (value.quantity < 2) cartList.remove(value);
    --value.quantity;
    _calcTotal();
  }
}