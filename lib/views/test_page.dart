import 'package:ai_safety_app/bloc/start_test/start_test_bloc.dart';
import 'package:ai_safety_app/common_widget/custom_app_bar.dart';
import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_safety_app/theme/app_colors.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StartTestBloc, StartTestState>(
      listener: (context, state) {
        if (state is StartTestLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is StartTestSuccess) {
          Navigator.pop(context);
        } else if (state is StartTestFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          mainTitle: 'Start Test',
          subTitle: 'Prepare to begin the test',
        ),
        body: Container(
          width: double.infinity,
          color: AppColors.backgroundPageColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to the Aegis AI Test",
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  "Click the button below to start the test. Answer the questions to the best of your ability.",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  text: 'Start Test',
                  onPressed: () {
                    context.read<StartTestBloc>().add(
                          StartTest(
                            title: 'Test Title Example',
                          ),
                        );
                  },
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  "Good luck! We believe in you.",
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
