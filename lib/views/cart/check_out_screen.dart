import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/custom_appbar.dart';
import 'package:home_screen/component/custom_button.dart';
import 'package:home_screen/component/enums/e_payment_method.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/component/local_keys.dart';
import 'package:home_screen/controllers/products/products_controller.dart';

import 'success_payment_screen.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen(this.controller, {super.key});
  final ProductsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(screenTitle: LocaleKeys.checkOut),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _address,
                  _gap,
                  _shippingMode,
                  _gap,
                  _yourCart,
                  _gap,
                  _paymentMethods
                ])),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              _headContainer(LocaleKeys.coupon, LocaleKeys.addCouponCode),
              _gap,
              Row(children: [
                Column(
                  children: [
                    const CustomText(text: LocaleKeys.total),
                    CustomText(
                        text: controller.totalCartProducts,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                const Spacer(),
                CustomButton(
                    width: 120,
                    text: LocaleKeys.checkOut,
                    onPress: () {
                      controller.cartList.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SuccessPaymentScreen()));
                    })
              ])
            ])));
  }

  Widget get _gap => const Gap(height: 10.0);

  Widget get _address => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headContainer(LocaleKeys.shippingAddrese, LocaleKeys.changeAddrese),
          _gap,
          _customCard(const SizedBox(
            width: double.infinity,
            child: CustomText(
                text:
                    'Ali Jbor, +970569206043\nYatta,Hebron,WestBank\n00970, abd alqader st.'),
          ))
        ],
      );

  Widget get _shippingMode =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _headContainer(LocaleKeys.shippingMode, LocaleKeys.changeMode),
        _gap,
        _customCard(const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Flat Rate'),
              CustomText(text: "\$20")
            ]))
      ]);

  Widget get _yourCart =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _headContainer(LocaleKeys.yourCart, LocaleKeys.viewAll),
        _gap,
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    controller.cartList.length,
                    (index) => _customCard(SizedBox(
                        height: 80,
                        child: Image.network(
                            controller.cartList[index].product.image,
                            fit: BoxFit.fill)))).toList()))
      ]);

  Widget get _paymentMethods =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _headContainer(LocaleKeys.yourCart, LocaleKeys.viewAll),
        _gap,
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    EPaymnetMethod.values.length,
                    (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xfff1f1f1)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                              EPaymnetMethod.values[index].link,
                              fit: BoxFit.fill),
                        ))).toList()))
      ]);

  Widget _customCard(Widget child) {
    return Card(
        shadowColor: Colors.grey,
        elevation: 3.5,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(padding: const EdgeInsets.all(16.0), child: child));
  }

  Widget _headContainer(String title, String subTitle,
      {VoidCallback? onPress}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomText(
          text: title,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          size: 16),
      InkWell(onTap: onPress, child: CustomText(text: subTitle, size: 16))
    ]);
  }
}