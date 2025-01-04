import 'package:ai_safety_app/bloc/auth/auth_bloc.dart';
import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:ai_safety_app/common_widget/navigation_menu.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
        elevation: 2.0,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavigationMenu()),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    "Get Started Now!",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                const SizedBox(height: 120),
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
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
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
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {},
                  text: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
