import 'package:ai_safety_app/common_widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_safety_app/common_widget/custom_row.dart';
import 'package:ai_safety_app/bloc/tests/tests_bloc.dart';
import 'package:ai_safety_app/views/list/add_expert_request.dart';

class ExpertRequest extends StatelessWidget {
  const ExpertRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: 'Expert Test',
        subTitle: 'All Expert Test here are listed here',
        icon: Icons.add_moderator,
        onIconPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddExpertRequest();
              },
            ),
          );
        },
      ),
      body: BlocBuilder<TestsBloc, TestsState>(
        builder: (context, state) {
          if (state is TestsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TestsListSuccess) {
            final List<Map<String, dynamic>> expertTests = state.data
                .where((test) => test['expert_id'] != 0)
                .map((test) => {
                      'title': test['title'] ?? '',
                      'questions': test['questions_count'].toString(),
                      'security': test['security'] ?? '-',
                      'status': test['test_state'] ?? '',
                    })
                .toList();

            if (expertTests.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No expert tests available",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: expertTests.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomRow(data: expertTests[index]),
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
