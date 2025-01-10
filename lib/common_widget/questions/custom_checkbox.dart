import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final Map<String, dynamic> data;
  final Function(String) onResponse;

  const CustomCheckbox({
    super.key,
    required this.data,
    required this.onResponse,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  final List<String> selectedOptions = [];

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
            return _checkboxOption(
              context,
              value: optionTitle,
              label: optionTitle,
            );
          }),
        ],
      ),
    );
  }

  Widget _checkboxOption(
    BuildContext context, {
    required String value,
    required String label,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedOptions.contains(value)) {
            selectedOptions.remove(value);
          } else {
            selectedOptions.add(value);
          }
          widget.onResponse(selectedOptions.join(','));
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: selectedOptions.contains(value)
              ? const Color(0xFF16354D)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(
              color: Color.fromARGB(66, 0, 0, 0),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: selectedOptions.contains(value)
                ? const Color(0xFF16354D)
                : Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Checkbox(
              value: selectedOptions.contains(value),
              onChanged: (bool? newValue) {
                setState(() {
                  if (newValue == true) {
                    selectedOptions.add(value);
                  } else {
                    selectedOptions.remove(value);
                  }
                  widget.onResponse(selectedOptions.join(','));
                });
              },
              activeColor: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: selectedOptions.contains(value)
                        ? Colors.white
                        : Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
