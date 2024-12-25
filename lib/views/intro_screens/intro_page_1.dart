import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/intro/intro-1.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 300,
            child: Stack(children: <Widget>[
              Positioned(
                top: 0,
                left: 10,
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Center(
                    child: Text(
                      "You must know your weakness \nbefore anyone.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
