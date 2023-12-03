import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPress, required this.text});
  final VoidCallback onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 45.0,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff7b4cfd), elevation: 0.0),
            onPressed: onPress,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            )));
  }
}