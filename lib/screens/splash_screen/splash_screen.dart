import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minor_project/screens/wrapper.dart';

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Wrapper())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25.0, top: 100.0),
      alignment: Alignment.center,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('lib/assets/images/logo_2.png'),
          ),
          SizedBox(height: 17.0),
          Row(
            children: <Widget>[
              SizedBox(width: 17.0),
              Text(
                "NIE",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 45.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(width: 17.0),
              Text(
                "Answer",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 45.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Text(
                "Hub",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 45.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    color: Colors.lightGreenAccent),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 58.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Connecting People With",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 14.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w100,
                      color: Colors.white),
                ),
                SizedBox(width: 6.0),
                Text(
                  "Knowledge",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 14.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w100,
                      color: Colors.lightGreenAccent),
                )
              ],
            ),
          ),
          SizedBox(height: 250.0),
          Image(
            image: AssetImage('lib/assets/images/nie_logo.png'),
            height: 70.0,
            width: 55.0,
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splash Screen Example")),
      body: Center(
          child: Text("Welcome to Home Page",
              style: TextStyle(color: Colors.black, fontSize: 30))),
    );
  }
}
