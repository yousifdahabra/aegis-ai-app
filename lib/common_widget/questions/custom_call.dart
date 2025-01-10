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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomInput(
              label: 'what do you do when recive calling',
              hint: 'write here',
              icon: Icon(Icons.call_end),
              multiLine: true,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
