import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'title',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        'message',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
