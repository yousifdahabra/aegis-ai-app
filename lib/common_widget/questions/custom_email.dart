import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:flutter/material.dart';

class CustomEmail extends StatefulWidget {
  const CustomEmail({super.key});

  @override
  State<CustomEmail> createState() => _CustomEmailState();
}

class _CustomEmailState extends State<CustomEmail> {
  final List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
