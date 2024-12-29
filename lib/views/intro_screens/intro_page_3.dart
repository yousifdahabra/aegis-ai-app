import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

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
                  image: AssetImage('assets/images/intro/intro-3.png'),
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
                          "You're ready to take control.",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    )),
              ),
              Positioned(
                top: 110,
                left: 10,
                child: FadeInUp(
                    duration: Duration(milliseconds: 1600),
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Center(
                        child: Text(
                          "Questions tailored to your answers.\nStart your journey to becoming smarter\nand safer today!",
                          style: Theme.of(context).textTheme.titleSmall,
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
