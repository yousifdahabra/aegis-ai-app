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
    return Scaffold();
  }
}
