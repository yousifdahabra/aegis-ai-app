import 'package:ai_safety_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.data,
  });
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withAlpha(10),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildColumn(context, data['title'] ?? '', "Title"),
          _buildColumn(context, data['questions'] ?? '', "Questions"),
          _buildColumn(context, data['security'] ?? '', "Security"),
          _buildColumn(context, data['status'] ?? '', "Status"),
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: AppColors.linksColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
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
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(90),
                ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
