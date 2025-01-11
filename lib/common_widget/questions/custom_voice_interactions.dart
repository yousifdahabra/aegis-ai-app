import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class CustomVoiceInteractions extends StatefulWidget {
  final String questionText;

  const CustomVoiceInteractions({
    super.key,
    required this.questionText,
  });

  @override
  State<CustomVoiceInteractions> createState() =>
      _CustomVoiceInteractionsState();
}

class _CustomVoiceInteractionsState extends State<CustomVoiceInteractions> {
  final FlutterTts _flutterTts = FlutterTts();
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isSpeaking = false;
  bool _isListening = false;
  String _userResponse = "";

  Future<void> _speakQuestion(String text) async {
    setState(() {
      _isSpeaking = true;
      _isListening = false;
    });

    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);

    await _flutterTts.speak(text);
  }

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
          ],
        ),
      ),
    );
  }
}
