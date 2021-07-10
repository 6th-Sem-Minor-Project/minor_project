import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minor_project/screens/wrapper.dart';
import 'package:minor_project/services/auth_service.dart';
import 'package:provider/provider.dart';
import './models/user.dart';
import './models/question.dart';
import './models/answer.dart';
import './services/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bgColor = const Color(0xFF01002c);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<String>.value(
          value: AuthService().user,
        ),
        StreamProvider<List<Question>>.value(
          value: DatabaseService().questions,
        ),
        StreamProvider<List<Answer>>.value(
          value: DatabaseService().answers,
        ),
        StreamProvider<List<UserModel>>.value(
          value: DatabaseService().userProfile,
        ),
      ],
      child: MaterialApp(
        // theme: ThemeData(
        //   primaryTextTheme: TextTheme(
        //     bodyText1: TextStyle(
        //       color: Colors.white,
        //     ),
        //   ),
        //   backgroundColor: bgColor,
        // ),

        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final firebaseUser = context.watch<User>();

    // if (firebaseUser != null) {
    //   return HomePage();
    // } else {
    //   return LoginPage();
    // }
    return Wrapper();
  }
}
