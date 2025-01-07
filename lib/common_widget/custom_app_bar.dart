import 'package:ai_safety_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.mainTitle,
    this.subTitle,
  });

  final String mainTitle;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          if (subTitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subTitle!,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ],
      ),
      backgroundColor: AppColors.mainTitleColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
