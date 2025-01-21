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
        appBar: AppBar(
          title: const Text('Test Details'),
          backgroundColor: const Color(0xFF16354D),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Test Title',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Text(
                'User: user_name',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 5),
              Text(
                'Status:test_state',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 5),
              Text(
                'Questions:questions_count ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              const Divider(height: 20, thickness: 2),
              Text(
                'Questions',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
