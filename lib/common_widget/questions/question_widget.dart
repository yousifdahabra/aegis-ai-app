import 'package:ai_safety_app/common_widget/questions/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'custom_question_input.dart';

final Map<String, Widget Function(dynamic data, Function(String) onResponse)>
    questionWidget = {
  '1': (data, onResponse) => CustomQuestionInput(
        data: data,
        onResponse: onResponse,
      ),
  '2': (data, onResponse) =>
      CustomRadioButton(data: data, onResponse: onResponse),

  // '3': (data, onResponse) => CustomQuestionRadio(data: data, onResponse: onResponse),
};
