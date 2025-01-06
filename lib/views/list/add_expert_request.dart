import 'package:ai_safety_app/bloc/user_expert_requests/user_expert_request_bloc.dart';
import 'package:ai_safety_app/common_widget/custom_alert_dialog.dart';
import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:ai_safety_app/common_widget/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpertRequest extends StatelessWidget {
  const AddExpertRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final aboutUserController = TextEditingController();
    final userNoteController = TextEditingController();
    final linksController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("New Request", style: TextStyle(fontSize: 22)),
              SizedBox(height: 4),
              Text("Better test will be with more information",
                  style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        body: BlocListener<UserExpertRequestBloc, UserExpertRequestState>(
          listener: (context, state) {
            if (state is UserExpertRequestSuccess) {
              showCustomAlert(
                context,
                title: 'Success',
                message: state.message,
                isSuccess: true,
              );
            } else if (state is UserExpertRequestFailure) {
              showCustomAlert(
                context,
                title: 'Error',
                message: state.error,
                isSuccess: false,
              );
            }
          },
          child: SingleChildScrollView(
            reverse: true,
            child: Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomInput(
                      label: 'Tell me about you',
                      hint: 'Study, works, or experience',
                      icon: Icon(Icons.draw),
                      multiLine: true,
                      controller: aboutUserController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'about is required';
                        } else if (value.length < 12) {
                          return 'about must be at least 12 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomInput(
                      label: 'Have you been scammed?',
                      hint:
                          'yes, how or no, what will you do if you face a scammer',
                      icon: Icon(Icons.help),
                      multiLine: true,
                      controller: userNoteController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Note is required';
                        } else if (value.length < 12) {
                          return 'Note must be at least 12 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomInput(
                      label: 'Social Links',
                      hint: 'links',
                      icon: Icon(Icons.link),
                      multiLine: true,
                      controller: linksController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'Add',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
