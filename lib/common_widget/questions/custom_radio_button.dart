import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String selectedOption = 'None Select';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: RadioMenuButton(
        value: "question1",
        groupValue: selectedOption,
        onChanged: (selectOption) {},
        child: Text(
          "question1",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
