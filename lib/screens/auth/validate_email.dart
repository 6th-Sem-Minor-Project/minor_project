import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:minor_project/screens/home/home_page.dart';

class VeifyEmail extends StatefulWidget {
  @override
  _VeifyEmailState createState() => _VeifyEmailState();
}

class _VeifyEmailState extends State<VeifyEmail> {
  final instance = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = instance.currentUser;
    user.reload();
    if (!user.emailVerified) {
      user.sendEmailVerification();
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        checkEmailVerified();
      });
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Email'),
      ),
      body: Center(
        child: Text(
            'An email has been sent to user mail id. Plaese verify your email...'),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = instance.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      return;
    }
  }
}
