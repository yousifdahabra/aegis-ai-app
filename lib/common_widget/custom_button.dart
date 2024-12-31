import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Title',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
