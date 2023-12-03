import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/custom_button.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/data/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(this.item, {super.key});
  final Product item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomButton(onPress: () {}, text: LocaleKeys.addToCart),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    image: DecorationImage(
                        image: NetworkImage(item.image), fit: BoxFit.fill)),
                height: 300,
              ),
              Column(
                children: [
                  const Gap.v(20),
                  Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: const BackButton())
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 250.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.0))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _amountWithFavDetail,
                    const Gap.v(10),
                    CustomText(
                        text: item.name,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: 18),
                    const Gap.v(10),
                    const CustomText(
                        text: LocaleKeys.discription,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: 16),
                    const Gap.v(10)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get _amountWithFavDetail => Row(
        children: [
          CustomText(
              text: '${item.currency}${item.amount}',
              color: Colors.deepPurpleAccent),
          const Gap.h(30),
          Container(
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                border: Border.all(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: CustomText(text: '30% OFF', size: 10, color: Colors.red),
            ),
          ),
          const Spacer(),
          Icon(
            _isFav ? Icons.favorite : Icons.favorite_border,
            color: _isFav ? Colors.red : Colors.deepPurpleAccent,
          )
        ],
      );

  bool get _isFav => (item.isFavorite ?? false);
}