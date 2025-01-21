import 'package:ai_safety_app/common_widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_safety_app/bloc/test_details/test_details_bloc.dart';

class TestDetailsPage extends StatelessWidget {
  final int testId;

  const TestDetailsPage({super.key, required this.testId});

  @override
  Widget build(BuildContext context) {
    context.read<TestDetailsBloc>().add(FetchTestDetailsEvent(testId: testId));

    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: 'Test Details',
      ),
      body: BlocBuilder<TestDetailsBloc, TestDetailsState>(
        builder: (context, state) {
          if (state is TestDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TestDetailsSuccess) {
            final Map<String, dynamic> testDetails = state.test;
            final List<Map<String, dynamic>> questions = state.questions;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testDetails['title'] ?? 'Test Title',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'User: ${testDetails['user_name']}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Status: ${testDetails['test_state']}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Questions: ${testDetails['questions_count']}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  if (testDetails['security'] != null)
                    Text(
                      'Security: ${testDetails['security']}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.green),
                    ),
                  const Divider(height: 20, thickness: 2),
                  Text(
                    'Questions',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  ...questions.map((question) {
                    return ListTile(
                      title: Text(
                        question['title'] ?? 'Question Title',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        'Answer: ${question['option_answer'] ?? 'Not answered'}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                    );
                  }),
                ],
              ),
            );
          } else if (state is TestDetailsFailure) {
            return Center(
              child: Text(
                "Error: ${state.error}",
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
