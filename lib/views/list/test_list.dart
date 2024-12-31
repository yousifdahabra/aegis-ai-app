import 'package:flutter/material.dart';

class TestList extends StatelessWidget {
  const TestList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'title': 'Test Title',
        'security': '75%',
        'status': 'Done',
        'questions': '10',
      },
      {
        'title': 'Another Test',
        'security': '80%',
        'status': 'Completed',
        'questions': '12',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test List"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: data.length,
        itemBuilder: (context, index) {},
      ),
    );
  }
}
