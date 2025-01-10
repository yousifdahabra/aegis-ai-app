import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/questions/custom_checkbox.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final Map<String, dynamic> data;
  final Function(String) onResponse;

  const CustomRadioButton({
    super.key,
    required this.data,
    required this.onResponse,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String selectedOption = 'None Select';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CustomCheckbox();
                  },
                ),
              );
            },
            text: 'Next',
          ),
        ],
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
