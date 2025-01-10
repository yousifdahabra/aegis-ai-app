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
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    final options = widget.data['options'] as List<dynamic>? ?? [];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.data['title'] ?? 'Question',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          ...options.map((option) {
            final optionTitle = option['title'] ?? 'Option';
            return _radioOption(
              context,
              value: optionTitle,
              groupValue: selectedOption,
              label: optionTitle,
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _radioOption(
    BuildContext context, {
    required String value,
    required String? groupValue,
    required String label,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = value;
        });
        widget.onResponse(value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: groupValue == value ? const Color(0xFF16354D) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(66, 0, 0, 0),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: groupValue == value ? const Color(0xFF16354D) : Colors.grey,
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
                  selectedOption = newValue;
                });
                widget.onResponse(newValue!);
              },
              activeColor: Colors.white,
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
