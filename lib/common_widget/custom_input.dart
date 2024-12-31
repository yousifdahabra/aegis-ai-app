import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required this.label,
    required this.hint,
  }) : super(key: key);

  final String label;
  final String hint;

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
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: Theme.of(context).textTheme.headlineSmall,
        hintText: 'Please enter your username',
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
