import 'package:flutter/material.dart';

class ExpertRequest extends StatelessWidget {
  const ExpertRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'title': 'Request Title',
        'questions': '10',
        'security': '75%',
        'status': 'Done',
      },
      {
        'title': 'Another Request',
        'questions': '12',
        'security': '-',
        'status': 'Start',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Expert Request", style: TextStyle(fontSize: 22)),
            SizedBox(height: 4),
            Text("All request here", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text('data'),
          );
        },
      ),
    );
  }
}
