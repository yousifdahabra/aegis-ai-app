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
      ],
    );
  }
}
