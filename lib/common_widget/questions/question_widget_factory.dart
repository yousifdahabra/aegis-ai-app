import 'package:flutter/material.dart';
import 'custom_question_input.dart';

final Map<String, Widget Function(dynamic data)> questionWidgetFactory = {
  'input': (data) => CustomQuestionInput(data: data),
};
