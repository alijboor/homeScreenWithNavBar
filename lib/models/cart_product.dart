import 'package:home_screen/models/product.dart';

class CartProduct {
  Product product;
  int quantity;
  CartProduct(this.product, {this.quantity = 1});
}