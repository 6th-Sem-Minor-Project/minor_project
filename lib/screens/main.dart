import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Nunito"
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Center(
            child: LoginPage(),
          ),
        ),
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  int _pageState = 0;
  var _backgroundcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                      top: 70
                    ),
                    child: Text("Ask a Question",
                    style:TextStyle(
                      color: Colors.blue[900],
                      fontSize: 28
                    ))
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text("Get the answer for all technical and non-technical questions from your peers, your seniors and even lecturers. ",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 16
                  ),
                  ),
                )
              ],
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 38
            ),
            child: Center(
              child: Image.asset("assets/images/splash.png"),
            ),
          ),
          Container(
             child:GestureDetector(
               onTap: (){
                 setState((){
                   _pageState=1;
                 });
               },
               child: Container(
                margin: EdgeInsets.all(32),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: Container(
                    child: Text(
                     "Get Started",style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                       ),
                     ),
                  ),
                )
            ),
             ),
          ),
        ],
      ),
    );
  }
}


