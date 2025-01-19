import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:ai_safety_app/common_widget/questions/custom_call.dart';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomInput(
              label: 'what do you do when see the email',
              hint: 'write here',
              icon: Icon(Icons.email),
              multiLine: true,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CustomCall();
                    },
                  ),
                );
              },
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
