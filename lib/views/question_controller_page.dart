import 'package:flutter/material.dart';

class QuestionControllerPage extends StatelessWidget {
  const QuestionControllerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Question'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
