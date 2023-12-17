import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  const LoadingWidget(
      {Key? key,
        this.backgroundColor = Colors.grey,
        this.color = Colors.indigoAccent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        backgroundColor: backgroundColor,
      ),
    );
  }
}