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
      appBar: AppBar(
        title: const Text('Radio Button'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "question1",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 20,
            ),
            _radioOption(
              context,
              value: "Option 2",
              groupValue: selectedOption,
              label: "Option 2",
            ),
            SizedBox(
              height: 20,
            ),
            _radioOption(
              context,
              value: "Option 1",
              groupValue: selectedOption,
              label: "Option 1",
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioOption(
    BuildContext context, {
    required String value,
    required String groupValue,
    required String label,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: groupValue == value ? Color(0xFF16354D) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(66, 0, 0, 0),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: groupValue == value ? Color(0xFF16354D) : Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: (newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              activeColor: Colors.white,
              fillColor: WidgetStateProperty.all(
                  groupValue == value ? Colors.white : Colors.black),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: groupValue == value ? Colors.white : Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
