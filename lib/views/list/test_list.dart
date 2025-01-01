import 'package:ai_safety_app/common_widget/custom_row.dart';
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
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Test List", style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CustomRow(data: data[index]),
          );
        },
      ),
    );
  }
}
