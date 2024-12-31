import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      ),
    );
  }
}
