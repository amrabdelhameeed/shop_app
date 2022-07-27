import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final BuildContext? context;
  const CustomText({Key? key, required this.text, this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Theme.of(context).textTheme.headline4!.color),
    );
  }
}
