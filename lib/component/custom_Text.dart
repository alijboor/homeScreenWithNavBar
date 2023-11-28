import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.color,
      this.size = 14.0,
      this.fontWeight,
      this.overflow,
      this.align});

  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;

  final TextOverflow? overflow;

  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        textAlign: align,
        style: TextStyle(
            color: color ?? Colors.grey,
            fontSize: size,
            fontWeight: fontWeight));
  }
}