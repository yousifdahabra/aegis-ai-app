import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.data,
  });
  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildColumn(context, data['title'] ?? '', "Title"),
        _buildColumn(context, data['security'] ?? '', "Security"),
        _buildColumn(context, data['status'] ?? '', "Status"),
        _buildColumn(context, data['questions'] ?? '', "Questions"),
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
