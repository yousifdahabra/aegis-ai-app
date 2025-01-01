import 'package:flutter/material.dart';

class ExpertRequest extends StatelessWidget {
  const ExpertRequest({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
