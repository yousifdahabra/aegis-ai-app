import 'package:ai_safety_app/data/repositories/tests_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_safety_app/common_widget/custom_row.dart';
import 'package:ai_safety_app/bloc/tests/tests_bloc.dart';

class TestList extends StatelessWidget {
  const TestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Test List", style: TextStyle(fontSize: 22)),
            SizedBox(height: 4),
            Text("All previous tests are listed here",
                style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: BlocBuilder<TestsBloc, TestsState>(
        builder: (context, state) {
          if (state is TestsListLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox();
        },
      ),
    );
  }
}
