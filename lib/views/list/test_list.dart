import 'package:ai_safety_app/common_widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_safety_app/common_widget/custom_row.dart';
import 'package:ai_safety_app/bloc/tests/tests_bloc.dart';

class TestList extends StatelessWidget {
  const TestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: 'Test List',
        subTitle: 'All previous tests are listed here',
      ),
      body: BlocBuilder<TestsBloc, TestsState>(
        builder: (context, state) {
          if (state is TestsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TestsListSuccess) {
            final List<Map<String, dynamic>> testData = state.data
                .map((test) => {
                      'title': test['title'] ?? '',
                      'questions': test['questions_count'].toString(),
                      'security': test['security'] ?? '-',
                      'status': test['test_state'] ?? '',
                    })
                .toList();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: testData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomRow(data: testData[index]),
                  );
                },
              ),
            );
          } else if (state is TestsListFailure) {
            return Center(
              child: Text(
                "Failed to load data: ${state.message}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
