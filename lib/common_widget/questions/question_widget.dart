import 'package:flutter/material.dart';
import 'custom_question_input.dart';

final Map<String, Widget Function(dynamic data)> questionWidget = {
  '1': (data) => CustomQuestionInput(data: data), //input
};
