import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String selectedOption = 'None Select';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "question1",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: RadioMenuButton(
                value: "question1",
                groupValue: selectedOption,
                onChanged: (selectValue) {
                  setState(() => selectedOption = selectValue!);
                },
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(2),
                    backgroundColor:
                        const WidgetStatePropertyAll(Colors.amber)),
                child: Text(
                  "question1",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
