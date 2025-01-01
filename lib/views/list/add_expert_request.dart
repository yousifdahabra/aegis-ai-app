import 'package:flutter/material.dart';

class AddExpertRequest extends StatelessWidget {
  const AddExpertRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("New Request", style: TextStyle(fontSize: 22)),
            SizedBox(height: 4),
            Text("Better test will be with more information",
                style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
