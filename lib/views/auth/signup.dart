import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        elevation: 2.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                CustomInput(
                  label: 'Name',
                  hint: 'Enter your Name',
                  icon: Icon(Icons.person),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInput(
                  label: 'Email',
                  hint: 'Enter your Email',
                  icon: Icon(Icons.email),
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInput(
                  label: 'Age',
                  hint: 'Enter your age',
                  icon: Icon(Icons.date_range),
                  type: TextInputType.datetime,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInput(
                  label: 'Password',
                  hint: 'Enter your Password',
                  icon: Icon(Icons.password),
                  scure: true,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              onPressed: () {},
              text: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
