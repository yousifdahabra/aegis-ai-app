import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            children: [],
          ),
        ),
      ],
    );
  }
}
