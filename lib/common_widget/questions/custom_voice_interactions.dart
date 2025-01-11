import 'package:ai_safety_app/common_widget/custom_button.dart';
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
  int _retryCount = 0;
  final int _maxRetries = 3;

  @override
  void initState() {
    super.initState();
    _speakQuestion(widget.questionText);
  }

  Future<void> _speakQuestion(String text) async {
    setState(() {
      _isSpeaking = true;
      _isListening = false;
      _retryCount = 0;
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
      onError: (error) async {},
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

    widget.onResponse(_userResponse.isEmpty ? "Not Answered" : _userResponse);
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _speechToText.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            decoration: BoxDecoration(
              color: _isListening
                  ? const Color(0xFF289DD2)
                  : const Color(0xFF16354D),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isListening
                  ? Icons.mic
                  : _isSpeaking
                      ? Icons.volume_up
                      : Icons.mic_off,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 20),
          if (_isListening && _userResponse.isEmpty)
            Text("Listening...", style: Theme.of(context).textTheme.bodyLarge),
          if (_userResponse.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Your Response: $_userResponse",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          const SizedBox(height: 30),
          CustomButton(
            text: 'Restart Speaking',
            onPressed: () {
              _speakQuestion(widget.questionText);
            },
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          const SizedBox(height: 20),
          if (_isListening || _userResponse.isNotEmpty)
            CustomButton(
              text: 'Next',
              onPressed: _stopListening,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
        ],
      ),
    );
  }
}
