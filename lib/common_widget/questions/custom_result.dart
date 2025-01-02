import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/navigation_menu.dart';
import 'package:flutter/material.dart';

class CustomResult extends StatefulWidget {
  const CustomResult({super.key});

  @override
  State<CustomResult> createState() => _CustomResultState();
}

class _CustomResultState extends State<CustomResult> {
  final List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Your result",
              style: Theme.of(context).textTheme.headlineSmall,
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
                      return NavigationMenu();
                    },
                  ),
                );
              },
              text: 'Back',
            ),
          ],
        ),
      ),
    );
  }
}
