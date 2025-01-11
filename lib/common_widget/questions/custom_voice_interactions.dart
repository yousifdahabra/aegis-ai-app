import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

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
  final FlutterTts _flutterTts = FlutterTts();
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isSpeaking = false;
  bool _isListening = false;
  String _userResponse = "";

  @override
  void initState() {
    super.initState();
    _speakQuestion(widget.questionText);
  }

  Future<void> _speakQuestion(String text) async {
    setState(() {
      _isSpeaking = true;
      _isListening = false;
    });

    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);

    await _flutterTts.speak(text);

    _flutterTts.setCompletionHandler(() {
      setState(() {
        _isSpeaking = false;
      });
      _startListening();
    });
  }

  Future<void> _startListening() async {
    bool available = await _speechToText.initialize(
      onStatus: (status) => print("STT Status: $status"),
      onError: (error) => print("STT Error: $error"),
    );

    if (available) {
      setState(() {
        _isListening = true;
        _userResponse = "";
      });

      _speechToText.listen(
        onResult: (result) {
          setState(() {
            _userResponse = result.recognizedWords;
          });
        },
      );
    } else {
      setState(() {
        _isListening = false;
      });
      print("Speech recognition not available");
    }
  }

  Future<void> _stopListening() async {
    await _speechToText.stop();
    setState(() {
      _isListening = false;
    });

    widget.onResponse(_userResponse);
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _speechToText.stop();
    super.dispose();
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
            const SizedBox(height: 30),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: _isListening ? 100 : 80,
              height: _isListening ? 100 : 80,
            ),
          ],
        ),
      ),
    );
  }
}
