import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final bool isSuccess;
  final VoidCallback onPressed;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.isSuccess,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          color: isSuccess ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            'OK',
            style: TextStyle(
              color: isSuccess ? Colors.green : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

void showCustomAlert(
  BuildContext context, {
  required String title,
  required String message,
  required bool isSuccess,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        title: title,
        message: message,
        isSuccess: isSuccess,
        onPressed: () {
          Navigator.pop(context);
        },
      );
    },
  );
}
