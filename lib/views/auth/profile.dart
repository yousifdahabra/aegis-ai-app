import 'package:ai_safety_app/common_widget/custom_app_bar.dart';
import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: 'Profile',
        subTitle: 'Update your profile',
        icon: Icons.person,
        onIconPressed: () {},
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInput(
                label: 'Name',
                hint: 'Jack Jeak',
                icon: Icon(Icons.person),
              ),
              SizedBox(
                height: 10,
              ),
              CustomInput(
                label: 'Email Address',
                hint: 'jack_jeak_2025@gmail.com',
                icon: Icon(Icons.email),
              ),
              SizedBox(
                height: 10,
              ),
              CustomInput(
                label: 'Age',
                hint: '25',
                icon: Icon(Icons.date_range),
                type: TextInputType.datetime,
              ),
              SizedBox(
                height: 20,
              ),
              CustomInput(
                label: 'Old Password',
                hint: 'Enter your Old Password',
                icon: Icon(Icons.password),
                scure: true,
              ),
              SizedBox(
                height: 20,
              ),
              CustomInput(
                label: 'New password',
                hint: 'Enter your New password',
                icon: Icon(Icons.password),
                scure: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                onPressed: () {},
                text: 'Update',
              ),
            ],
          )),
    );
  }
}
