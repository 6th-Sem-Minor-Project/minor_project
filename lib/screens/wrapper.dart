import 'package:firebase_auth/firebase_auth.dart';

import '../screens/home/home_page.dart';
import 'package:provider/provider.dart';

import './auth/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<String>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
