import 'package:ai_safety_app/common_widget/custom_row.dart';
import 'package:flutter/material.dart';

class TestList extends StatelessWidget {
  const TestList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'title': 'Test Title',
        'questions': '10',
        'security': '75%',
        'status': 'Done',
      },
      {
        'title': 'Another Test',
        'questions': '12',
        'security': '80%',
        'status': 'Done',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Test List", style: TextStyle(fontSize: 22)),
            SizedBox(height: 4),
            Text("All previews test here", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CustomRow(data: data[index]),
            );
          },
        ),
      ),
    );
  }
}
