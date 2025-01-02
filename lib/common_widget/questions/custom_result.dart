import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:ai_safety_app/common_widget/navigation_menu.dart';
import 'package:ai_safety_app/views/list/test_list.dart';
import 'package:flutter/material.dart';

class CustomResult extends StatefulWidget {
  const CustomResult({super.key});

  @override
  State<CustomResult> createState() => _CustomResultState();
}

class _CustomResultState extends State<CustomResult> {
  final List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
    );
  }
}
