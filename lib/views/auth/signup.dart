import 'package:ai_safety_app/bloc/auth/auth_bloc.dart';
import 'package:ai_safety_app/common_widget/custom_alert_dialog.dart';
import 'package:ai_safety_app/common_widget/custom_app_bar.dart';
import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:ai_safety_app/common_widget/navigation_menu.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final ageController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
        appBar: CustomAppBar(
          mainTitle: 'Signup',
          icon: Icons.create,
          onIconPressed: () {},
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              showCustomAlert(
                context,
                title: 'Success',
                message: state.message,
                isSuccess: true,
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const NavigationMenu()),
              );
            } else if (state is AuthFailure) {
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
              child: Column(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          left: 30,
                          width: 100,
                          height: 200,
                          child: FadeInDown(
                              duration: Duration(seconds: 1),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/robot.png'))),
                              )),
                        ),
                        Positioned(
                          left: 150,
                          top: 110,
                          width: 100,
                          height: 200,
                          child: FadeInDown(
                              duration: Duration(milliseconds: 1200),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/fingerprint.png'))),
                              )),
                        ),
                        Positioned(
                          top: 65,
                          right: 30,
                          width: 80,
                          height: 100,
                          child: FadeInDown(
                              duration: Duration(milliseconds: 1300),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/robot-phone.png'))),
                              )),
                        ),
                        Positioned(
                          child: FadeInUp(
                              duration: Duration(milliseconds: 1600),
                              child: Container(
                                margin: EdgeInsets.only(top: 120),
                                child: Center(
                                  child: Text(
                                    "Get Started Now!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomInput(
                            label: 'Name',
                            hint: 'Enter your Name',
                            icon: const Icon(Icons.person),
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            label: 'Email',
                            hint: 'Enter your Email',
                            icon: const Icon(Icons.email),
                            type: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              final emailRegex =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            label: 'Age',
                            hint: 'Enter your Age',
                            icon: const Icon(Icons.date_range),
                            controller: ageController,
                            type: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Age is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            label: 'Password',
                            hint: 'Enter your Password',
                            icon: const Icon(Icons.password),
                            scure: true,
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthBloc>(context).add(
                                  SignupEvent(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    age: ageController.text,
                                  ),
                                );
                              }
                            },
                            text: 'Sign Up',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
