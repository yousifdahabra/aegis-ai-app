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
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TestDetailsSuccess) {
            final Map<String, dynamic> testDetails = state.test;
            final List<Map<String, dynamic>> questions = state.questions;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTestInfo(context, testDetails),
                  const Divider(height: 30, thickness: 2),
                ],
              ),
            );
          } else if (state is TestDetailsFailure) {
            return Center(
              child: Text(
                "Error: ${state.error}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.red),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildTestInfo(
      BuildContext context, Map<String, dynamic> testDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          testDetails['title'] ?? 'Test Title',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        _infoRow(
          context,
          label: 'User:',
          value: testDetails['user_name'] ?? 'N/A',
        ),
        _infoRow(
          context,
          label: 'Status:',
          value: testDetails['test_state'] ?? 'N/A',
        ),
        _infoRow(
          context,
          label: 'Questions:',
          value: '${testDetails['questions_count'] ?? 0}',
        ),
        if (testDetails['security'] != null)
          _infoRow(
            context,
            label: 'Security:',
            value: testDetails['security'] ?? 'N/A',
            valueColor: Colors.green,
          ),
      ],
    );
  }

  Widget _infoRow(BuildContext context,
      {required String label, required String value, Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: valueColor ?? Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionsSection(
      BuildContext context, List<Map<String, dynamic>> questions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Questions',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: questions.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final question = questions[index];
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
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF16354D),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
