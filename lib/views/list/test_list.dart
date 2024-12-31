import 'package:flutter/material.dart';

class TestList extends StatelessWidget {
  const TestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test List"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 12,
        itemBuilder: (context, index) {},
      ),
    );
  }
}
