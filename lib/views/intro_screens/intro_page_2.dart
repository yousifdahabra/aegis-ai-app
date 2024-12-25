import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

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
                  image: AssetImage('assets/images/intro/intro-2.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 300,
            child: Stack(children: <Widget>[
              Positioned(
                top: 0,
                left: 10,
                child: FadeInDown(
                    duration: Duration(milliseconds: 1600),
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Center(
                        child: Text(
                          "Discover how to protect yourself.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
