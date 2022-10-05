import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'screens/homepage.screens.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.orange,
            Colors.deepOrange,
            Colors.yellow,
            Colors.white,
          ])),
          padding: EdgeInsets.symmetric(horizontal: 25.00, vertical: 160),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                        radius: 30.00,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.computer,
                          color: Color(0xFF347bbb),
                          size: 30,
                        )),
                    SizedBox(width: 20.00),
                    Text(
                      'HacktoberFest 2022',
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 45.00,
                          color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  'An opportunity to start your open source journey',
                  style: TextStyle(color: Colors.white, fontSize: 20.00),
                ),
                SizedBox(
                  height: 130,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DefaultTextStyle(
                      style: TextStyle(
                          fontSize: 30.00,
                          fontFamily: 'Lobster',
                          color: Colors.white),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ScaleAnimatedText('Fork'),
                          ScaleAnimatedText('Add Changes'),
                          ScaleAnimatedText('Create Pull Request'),
                          ScaleAnimatedText('Get Your PR Merged'),
                        ],
                        totalRepeatCount: 1,
                        pause: Duration(milliseconds: 1000),
                        onFinished: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
