import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildColumn(context, "Test Title", "Title"),
        _buildColumn(context, "75%", "Security"),
        _buildColumn(context, "Done", "Status"),
        _buildColumn(context, "10", "Questions"),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildColumn(BuildContext context, String data, String title) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
