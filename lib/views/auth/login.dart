import 'package:ai_safety_app/bloc/login/login_bloc.dart';
import 'package:ai_safety_app/common_widget/custom_alert_dialog.dart';
import 'package:ai_safety_app/common_widget/custom_app_bar.dart';
import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:ai_safety_app/common_widget/navigation_menu.dart';
import 'package:ai_safety_app/views/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: 'Login',
      ),
      backgroundColor: Colors.white,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is LoginSuccess) {
            showCustomAlert(
              context,
              title: 'Success',
              message: state.message,
              isSuccess: true,
            );
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const NavigationMenu()),
              (route) => false,
            );
          } else if (state is LoginFailure) {
            Navigator.pop(context);
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
            children: <Widget>[
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
                                    image:
                                        AssetImage('assets/images/robot.png'))),
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
                                "Welcome Back!",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                            duration: Duration(milliseconds: 1800),
                            child: Column(
                              children: <Widget>[
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
                                    final emailRegex = RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                    if (!emailRegex.hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
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
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 1900),
                          child: CustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginBloc>(context).add(
                                  AuthLoginEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                              }
                            },
                            text: 'Login',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 2000),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Signup();
                                  },
                                ),
                              );
                            },
                            child: Text.rich(
                              TextSpan(
                                text: "Don't have an account? ",
                                style: Theme.of(context).textTheme.titleMedium,
                                children: [
                                  TextSpan(
                                    text: "Sign Up",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
