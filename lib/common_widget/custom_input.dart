import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required this.label,
    required this.hint,
    required this.icon,
    this.type = TextInputType.text,
    this.scure = false,
  }) : super(key: key);

  final String label;
  final String hint;
  final Icon icon;
  final TextInputType type;
  final bool scure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
      obscureText: scure,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.headlineSmall,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        prefixIcon: icon, //Icon(Icons.email)
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF16354D)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF289DD2)),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
