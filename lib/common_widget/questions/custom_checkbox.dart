import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Options",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            _checkboxOption(
              context,
              value: "Option 2",
              label: "Option 2",
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkboxOption(
    BuildContext context, {
    required String value,
    required String label,
  }) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(
              color: Color.fromARGB(66, 0, 0, 0),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (newValue) {},
              activeColor: Colors.white,
              checkColor: Colors.white,
              fillColor: WidgetStateProperty.all(Colors.black),
            ),
            const SizedBox(width: 8),
            Text(
              'label',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
