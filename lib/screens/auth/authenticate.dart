import 'package:flutter/material.dart';
import 'package:minor_project/screens/auth/login.dart';
import '../auth/sign_up.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignInPage = true;

  void toggleAuthForms() {
    setState(() {
      this.showSignInPage = !this.showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.showSignInPage
          ? LoginPage(this.toggleAuthForms)
          : SignUp(this.toggleAuthForms),
    );
  }
}
