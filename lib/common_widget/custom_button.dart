import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
