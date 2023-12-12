import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/controllers/cards/card_controller.dart';

class CardView extends StatefulWidget {
  CardView({super.key}) : _controller = CardController();
  final CardController _controller;

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: List.generate(
              widget._controller.cards.length,
              (index) {
                var value = widget._controller.cards[index];
                bool isSelected = selected == index;
                return InkWell(
                  onTap: () {
                    selected = index;
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 2.0,
                            color: isSelected
                                ? Colors.indigoAccent
                                : Colors.transparent)),
                    child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.0),
                            color: isSelected
                                ? const Color(0xff23272a)
                                : const Color(0xff23272a).withOpacity(0.5)),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: value.bankName,
                                  color: Colors.white,
                                ),
                                const Gap.v(20.0),
                                CustomText(
                                    text: value.cardNumber,
                                    color: Colors.white,
                                    size: 20),
                                const Gap.v(8.0),
                                Row(
                                  children: [
                                    const Gap.h(90.0),
                                    CustomText(
                                        text: value.expireDate,
                                        color: Colors.white,
                                        size: 10),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: value.holderName,
                                      color: Colors.white,
                                    ),
                                    const Spacer(),
                                    Container(
                                        height: 40,
                                        width: 60,
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.network(value.type.link,
                                            fit: BoxFit.fill))
                                  ],
                                ),
                              ],
                            ))),
                  ),
                );
              },
            ).toList())));
  }
}