import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/views/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        elevation: 2.0,
      ),
      backgroundColor: Colors.white,
      body: Column(
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
                                image: AssetImage('assets/images/robot.png'))),
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
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                FadeInUp(
                    duration: Duration(milliseconds: 1800),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color.fromRGBO(143, 148, 251, 1)),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(143, 148, 251, 1)))),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email or Phone number",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                FadeInUp(
                    duration: Duration(milliseconds: 1900),
                    child: CustomButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 135, vertical: 20),
                      onPressed: () {
                        print('Custom Button Pressed!');
                      },
                      text: 'Submit',
                    )),
                SizedBox(
                  height: 20,
                ),
                FadeInUp(
                  duration: Duration(milliseconds: 2000),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgotPassword');
                    },
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
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
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
