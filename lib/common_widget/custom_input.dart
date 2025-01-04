import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required this.label,
    required this.hint,
    required this.icon,
    this.type = TextInputType.text,
    this.scure = false,
    this.multiLine = false,
    this.validator,
    this.controller,
  }) : super(key: key);

  final String label;
  final String hint;
  final Icon icon;
  final TextInputType type;
  final bool scure;
  final bool multiLine;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: scure,
      keyboardType: multiLine
          ? TextInputType.multiline
          : (scure ? TextInputType.text : type),
      minLines: multiLine ? 3 : 1,
      maxLines: multiLine ? 5 : (scure ? 1 : 1),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.headlineSmall,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        prefixIcon: icon,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF16354D)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF289DD2)),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
