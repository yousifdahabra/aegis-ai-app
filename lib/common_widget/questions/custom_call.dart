import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:flutter/material.dart';

class CustomCall extends StatefulWidget {
  const CustomCall({super.key});

  @override
  State<CustomCall> createState() => _CustomCallState();
}

class _CustomCallState extends State<CustomCall> {
  final List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Call'),
      ),
    );
  }
}
