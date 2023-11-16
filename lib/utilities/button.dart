import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
