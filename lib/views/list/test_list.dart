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
