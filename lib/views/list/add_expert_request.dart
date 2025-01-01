import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:flutter/material.dart';

class AddExpertRequest extends StatelessWidget {
  const AddExpertRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("New Request", style: TextStyle(fontSize: 22)),
            SizedBox(height: 4),
            Text("Better test will be with more information",
                style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomInput(
              label: 'Tell me about you',
              hint: 'Study, works, or experience',
              icon: Icon(Icons.draw),
            ),
            SizedBox(
              height: 10,
            ),
            CustomInput(
              label: 'Have you been scammed?',
              hint: 'yes, how or no, what will you do if you face a scammer',
              icon: Icon(Icons.draw),
            ),
            SizedBox(
              height: 10,
            ),
            CustomInput(
              label: 'Social Links',
              hint: 'links',
              icon: Icon(Icons.draw),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              onPressed: () {},
              text: 'Add',
            ),
          ],
        ),
      ),
    );
  }
}
