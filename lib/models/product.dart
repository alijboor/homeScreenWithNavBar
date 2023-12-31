class Product {
  String image;
  String name;
  double amount;
  String currency;
  bool isFavorite;

  Product(this.name, this.image, this.amount, this.currency,
      {this.isFavorite = false});

  List<String> get searchInfo =>
      [currency, amount.toString(), name.toLowerCase()];
}