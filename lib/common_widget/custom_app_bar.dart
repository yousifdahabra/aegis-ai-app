import 'package:ai_safety_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.mainTitle,
    this.subTitle,
    this.icon,
    this.onIconPressed,
  });

  final String mainTitle;
  final String? subTitle;
  final IconData? icon;
  final VoidCallback? onIconPressed;

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
      iconTheme: const IconThemeData(
        color: AppColors.barTitle,
      ),
      actions: icon != null
          ? [
              IconButton(
                icon: Icon(icon),
                onPressed: onIconPressed,
                color: AppColors.barTitle,
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
