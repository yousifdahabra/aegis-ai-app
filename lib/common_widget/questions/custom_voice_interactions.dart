import 'package:flutter/material.dart';

class CustomVoiceInteractions extends StatefulWidget {
  final String questionText;
  final Function(String) onResponse;

  const CustomVoiceInteractions({
    super.key,
    required this.questionText,
    required this.onResponse,
  });

  @override
  State<CustomVoiceInteractions> createState() =>
      _CustomVoiceInteractionsState();
}

class _CustomVoiceInteractionsState extends State<CustomVoiceInteractions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Interaction'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.questionText,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text("text here"),
          ],
        ),
      ),
    );
  }
}
